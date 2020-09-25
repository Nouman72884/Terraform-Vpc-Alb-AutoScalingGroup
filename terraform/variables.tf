variable "AWS_REGION" {}
variable "AMIS" {
  type = map
  default = {
    "us-east-1" = "ami-0ac80df6eff0e70b5"
  }
}
variable "AWS_INSTANCE_TYPE" {}
variable "KEYPAIR_NAME" {}
variable "VPC_CIDR" {}
variable "PUBLIC_SUBNET" {}
variable "PRIVATE_SUBNET" {}

