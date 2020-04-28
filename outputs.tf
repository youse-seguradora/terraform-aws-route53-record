output "name" {
  description = "The record"
  value       = aws_route53_record.default.*.name
}

output "fqdn" {
  description = "The FQDN"
  value       = aws_route53_record.default.*.fqdn
}
