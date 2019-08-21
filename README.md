# terraform-aws-rails-counter

# Instructions
- your terraform version should be 0.12.x
- export your AWS access and AWS secret keys:
  ```
  export AWS_ACCESS_KEY_ID="XXXXXXXXXXXXXXXXXX"
  export AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  ```
- if you would like to use variables different than defaults, you can create file **terraform.tfvars** with following format:
  ```
  region = "your_region"
  ami = "your_ami"
  instance_type = "selected_instance_type"
  key_name = "name_of your_key_pair_without_.pem"
  private_key = "full_path_to_your_private_key"
  portainer_port = "portainer port"
  rails_counter = "rails_container_you_want_to_use(choose from here https://hub.docker.com/r/berchev/counter/tags)"
  redis_image = "redis_image_by_your_choice"
  redis_password = "prefered_password"
  ingress_ports = "[XX, XX, XX, XX]"
  aws_security_group_name = "name_for_security_group"
  ``` 
  These variables will override default values provided in vars.tf file
- then type this secuence of commands:
  ```
  terraform init
  terraform plan
  terraform apply
  ```
- after terraform finish output will be similar to this one:
  ```
  Outputs:

  ip_address = 54.89.205.178
  server_name = ec2-54-89-205-178.compute-1.amazonaws.com
  ```
- open new browser and type resulted **server_name:3000**
  ```
  ec2-54-89-205-178.compute-1.amazonaws.com:3000
  ```
- play with the counter
