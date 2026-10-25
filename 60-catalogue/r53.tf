resource "aws_route53_record" "backend_alb" {
  zone_id = var.zone_id
  name    = "*backend-alb-${var.environment}.devaradevops.online"
  type    = "A"
  
  alias {
    # AWS details
    name                   = aws_lb.backend_alb.dns_name
    zone_id                = aws_lb.backend_alb.zone_id
    evaluate_target_health = true
  }
  
  allow_overwrite = true
}
