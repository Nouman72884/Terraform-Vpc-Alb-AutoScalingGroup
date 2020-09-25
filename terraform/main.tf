module "vpc" {
  source = "./modules/vpc"
  AWS_REGION     = var.AWS_REGION
  VPC_CIDR = var.VPC_CIDR
  PUBLIC_SUBNET = var.PUBLIC_SUBNET
  PRIVATE_SUBNET = var.PRIVATE_SUBNET
}
module "alb" {
  source = "./modules/alb"
  vpc-id = module.vpc.vpc-id
  alb-security-group-id = module.vpc.alb-security-group-id
  public-subnets = module.vpc.public-subnets
  autoscaling-group-id = module.autoscaling.autoscaling-group-id
}
module "autoscaling" {
  source = "./modules/autoscaling"
  KEYPAIR_NAME = var.KEYPAIR_NAME
  AMIS = var.AMIS
  AWS_REGION     = var.AWS_REGION
  AWS_INSTANCE_TYPE = var.AWS_INSTANCE_TYPE
  instance-security-group-id = module.vpc.instance-security-group-id
  private-subnets = module.vpc.private-subnets
}
