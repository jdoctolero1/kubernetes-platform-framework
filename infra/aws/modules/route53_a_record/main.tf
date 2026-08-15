resource "aws_route53_record" "a_record" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = "A"
  ttl     = 300
  records = [var.private_ip]
}