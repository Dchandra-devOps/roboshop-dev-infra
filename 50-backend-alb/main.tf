resource "aws_lb" "backend_alb" {
  name               = "${local.common_name}-backend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_ids
  enable_deletion_protection = false  # if it is true we can not delete even with terrafrom

  tags = merge(
    {
        Name = "${local.common_name}-backend-alb"
    },
    local.common_tags
  )
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi, I am from HTTP Backend ALB</h1>"
      status_code  = "200"
    }
  }
}