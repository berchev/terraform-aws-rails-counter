provider "aws" {
  region = var.region
}

data "template_file" "provision_script" {
  template = file("${path.root}/provision.sh")

  vars = {
    port     = var.portainer_port
    counter  = var.rails_counter
    redis    = var.redis_image
    password = var.redis_password
  }
}

resource "aws_instance" "xenial" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.xenial_sg.id]
  key_name               = var.key_name
  provisioner "file" {
    content     = data.template_file.provision_script.rendered
    destination = "/tmp/script.sh"

    connection {
      host        = aws_instance.xenial.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.private_key}")
    }
  }
  provisioner "remote-exec" {
    connection {
      host        = aws_instance.xenial.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.private_key}")
    }

    inline = [
      "cd /tmp",
      "sudo bash ./script.sh",
    ]
  }
}


resource "aws_security_group" "xenial_sg" {
  name        = var.aws_security_group_name
  description = "Security group settings"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
