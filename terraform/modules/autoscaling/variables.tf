variable "AWS_REGION" {}
variable "AMIS"{}
variable "KEYPAIR_NAME" {}
variable "AWS_INSTANCE_TYPE" {}
variable "instance-security-group-id" {}
variable "NAME" {
  default = "autoscaling"
}
variable "private-subnets" {}

