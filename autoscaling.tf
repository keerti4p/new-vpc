// Auto Scaling group configuration

resource "aws_autoscaling_group" "app_asg" {
  launch_configuration = aws_launch_configuration.app_launch_configuration.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = module.vpc.private_subnets

  tags = [
    {
      key                 = "Name"
      value               = "${var.project_name}-asg"
      propagate_at_launch = true
    }
  ]
}

resource "aws_launch_configuration" "app_launch_configuration" {
  name          = "${var.project_name}-launch-configuration"
  image_id      = "ami-0c55b159cbfafe1f0" // Example AMI ID, replace with a valid one
  instance_type = "t2.micro"

  iam_instance_profile = aws_iam_role.ec2_role.name
  security_groups      = [aws_security_group.allow_ssh.id]

  lifecycle {
    create_before_destroy = true
  }
}
