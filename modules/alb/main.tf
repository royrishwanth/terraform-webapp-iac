resource "aws_lb" "web-lb" {
  name               = "demo-web-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "demo-web-load-balancer"
  }
}

resource "aws_lb_target_group" "web-tg" {
  name     = "demo-web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "demo-web-target-group"
  }
}

resource "aws_lb_target_group_attachment" "web-tg-attachment1" {
  target_group_arn = aws_lb_target_group.web-tg.arn
  target_id        = var.instance_ids[0]
  port             = 80

}

resource "aws_lb_target_group_attachment" "web-tg-attachment2" {
  target_group_arn = aws_lb_target_group.web-tg.arn
  target_id        = var.instance_ids[1]
  port             = 80

}
resource "aws_lb_listener" "web-listener" {
  load_balancer_arn = aws_lb.web-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-tg.arn
  }

  tags = {
    Name = "demo-web-listener"
  }
}
