# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_launch_configuration" "launchconfig" {
  name_prefix     = "${terraform.workspace}-launchconfig"
  image_id        = var.AMIS[var.AWS_REGION]
  instance_type   = var.AWS_INSTANCE_TYPE
  key_name        = var.KEYPAIR_NAME
  security_groups = [var.instance-security-group-id]
  
  
}

resource "aws_autoscaling_group" "autoscaling" {
  name                      = "${terraform.workspace}-${var.NAME}-autoscaling-group"
  vpc_zone_identifier       = var.private-subnets
  #target_group_arn          = var.targetgroup-arn
  #availability_zones        = data.aws_availability_zones.available.names
  launch_configuration      = aws_launch_configuration.launchconfig.name
  min_size                  = 2
  max_size                  = 2
  health_check_grace_period = 120
  health_check_type         = "EC2"
  default_cooldown          = 120
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "${terraform.workspace}-${var.NAME}-ec2 instance"
    propagate_at_launch = true
  }
}

