// Elastic Load Balancer configuration

resource "aws_lb" "app_lb" {
  name               = "${var.project_name}-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_ssh.id]
  subnets            = module.vpc.public_subnets

  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.project_name}-app-lb"
    }
  )
}
