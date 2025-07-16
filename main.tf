module "network" {
  source               = "./modules/network"
  vpc_cidr_block       = var.vpc_cidr_block
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet2_cidr = var.private_subnet2_cidr
  public_subnet1_cidr  = var.public_subnet1_cidr
  public_subnet2_cidr  = var.public_subnet2_cidr
  az1                  = var.az1
  az2                  = var.az2
}

module "compute" {
  source             = "./modules/compute"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_path           = var.key_path
  project_name       = var.project_name
  key_name           = var.key_name
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  user_data_1 =file(var.user_data_1)
  user_data_2 =file(var.user_data_2)

}


module "alb" {
  source            = "./modules/alb"
  public_subnet_ids = module.network.public_subnet_ids
  vpc_id            = module.network.vpc_id
  instance_ids = [
    module.compute.aws_instance_web_server_1_id,
    module.compute.aws_instance_web_server_2_id
  ]
  security_group_id = module.compute.security_group_id
}