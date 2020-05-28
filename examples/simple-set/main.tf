provider "aws" {
  region  = "us-east-1"
  profile = "cicd"
}

#######################
###   AWS Route53   ###
#######################
module "route53_zone" {
  source = "github.com/youse-seguradora/terraform-aws-route53-hosted-zone.git?ref=v0.0.1"

  domain_name = "test.dev"
}

module "route53_record" {
  source = "../.."

  name    = var.name
  zone_id = module.route53_zone.zone_id
  type    = "A"
  ttl     = "3600"
  values  = "10.0.0.27"
}

variable "name" {}

output "this_name" {
  value = module.route53_record.name[0]
}
output "this_fqdn" {
  value = module.route53_record.fqdn[0]
}
