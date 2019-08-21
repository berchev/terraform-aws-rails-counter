# module rails_counter

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

  server_name = ec2-100-26-102-65.compute-1.amazonaws.com
  server_public_ip = 100.26.102.65
  ```
- open new browser and type resulted **server_name:3000**:
  ```
  ec2-100-26-102-65.compute-1.amazonaws.com:3000
  ```
- play with the counter

## Kitchen test
```
Profile: default
Version: (not specified)
Target:  ssh://ubuntu@ec2-54-161-206-76.compute-1.amazonaws.com:22

  ✔  check_rails_site: HTTP GET on http://ec2-54-161-206-76.compute-1.amazonaws.com:3000
     ✔  HTTP GET on http://ec2-54-161-206-76.compute-1.amazonaws.com:3000 status should cmp == 200


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 1 successful, 0 failures, 0 skipped
       Finished verifying <default-ubuntu> (0m6.96s).
-----> Kitchen is finished. (0m8.33s)
```

## Some notes for me:
- Note that Kitchen tool use for authentication **terraform.tfvars** file
- Note that if test Terraform 0.12.x code, you need to specify terraform version into .kitchen.yml (in driver section):
  ```
  driver:
  name: terraform
  version: "0.12.6"
  variable_files:
    - terraform.tfvars

  ``` 
  If not done, kitchen will show error related to wrong version of terraform. 
  It will led to automatically changing of your local terraform version in the current terminal( to version 0.11.x )
  if you open new terminal, the version will be 0.12.x.
