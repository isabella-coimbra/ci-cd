# Docker-Ansible

## Description
Running docker on a machine on GCP, provisioning it via terraform and ansible.

## Requirements
- [Terraform](https://www.terraform.io/downloads.html) 
- An account in GCP.

## Terraform
In the folder to the repositorie we need to run the command:

``` ssh
terraform init
```
The above command will initialize the modules and the backend.

If this is the first time you are uploading the environment, it is important to run the command:

``` ssh
terraforming plan
```
It will show the execution plan with all the settings chosen in the ```main.tf``` file. So if all the settings are correct just run the command

 ``` ssh
terraform apply
 ```

If the environment is running on AWS and you want to see its settings, just run the command:

``` ssh
show terraform
```

## Ansible
To run the commands defined in ansible on hosts, just run the command:
``` ssh
ansible-playbook -i inventory.txt playbook.yml
```

* ```To execute only one ansible tasks you must pass the -t <task_name> argument.```

## Inputs

|Name|Description|Type|Default|
|:-:|:-:|:-:|:-:|
|project_id|"Name of the project"|string|--|
|region|Region of the instance|string|us-east-1|
|account_id|Id of the Service accoun|string|--|
|name|Name of the instance|string|--|
|zone|Zone of the instance|string|us-east1-b|
|machine_type|Type of the instance|string|e2-medium|
|boot_disk_type|The disk type for compute instance use|string|pd-standard|
|boot_disk_size|The disk size for compute instance use|number|10|
|subnetwork|Subnetwork for the project|string|--|
|network_ip|Ip for the instance|string|--|
|image_path|Instance image path|string|--|

## Inventory File

It is necessary to contain an inventory file with the information about the hosts. 

- Example:

``` ssh
[docker-dev]
173.82.115.165

[docker-dev:vars]
ansible_ssh_user=root
ansible_ssh_private_key_file=terraform/private_key
```

## Variables

In the playbook file (```playbook.yml```), set the variables related to your docker hub login:

``` ssh
vars:
    user_docker: ''
    password_docker: ''
    email_docker: ''
    repository_docker: ''
```
