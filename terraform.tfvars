vpc_cidr_block       = "192.168.0.0/16"
private_subnet1_cidr = "192.168.1.0/24"
private_subnet2_cidr = "192.168.2.0/24"
public_subnet1_cidr  = "192.168.3.0/24"
public_subnet2_cidr  = "192.168.4.0/24"

az1 = "us-east-1a"
az2 = "us-east-1b"

ami_id        = "ami-020cba7c55df1f615"
instance_type = "t2.micro"
project_name  = "demo-web-app"

key_name = "demo-web-key"
key_path = "~/.ssh/id_rsa.pub"

user_data_1 = "userdata.sh"
user_data_2=  "userdata2.sh"