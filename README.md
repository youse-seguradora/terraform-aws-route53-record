# AWS Route53 Record Terraform module

Terraform module to create Route53 table record set resource on AWS.

## Prerequisites

This module has a few dependencies:

- [Terraform 0.12](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)
- [github.com/stretchr/testify/assert](https://github.com/stretchr/testify)
- [github.com/gruntwork-io/terratest/modules/terraform](https://github.com/gruntwork-io/terratest)

## Examples

**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/youse-seguradora/terraform-aws-route53-record/releases).

Here are some examples of how you can use this module in your inventory structure:

### Simple set

```hcl
  module "route53-record" {
    source  = "git::https://github.com/clouddrove/terraform-aws-route53-record.git?ref=tags/0.12.1"
    zone_id = "Z1XJD7SSBKXLC1"
    name    = "www"
    type    = "A"
    ttl     = "3600"
    values  = "10.0.0.27"
  }
```

### Set with alias

```hcl
  module "route53-record" {
    source  = "git::https://github.com/clouddrove/terraform-aws-route53-record.git?ref=tags/0.12.1"
    zone_id = "Z1XJD7SSBKXLC1"
    name    = "www."
    type    = "A"
    alias   = {
      name = "d130easdflja734js.cloudfront.net"
      zone_id = "Z2FDRFHATA1ER4"
      evaluate_target_health = false
    }
  }
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.24 |
| aws | ~> 2.58 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.58 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alias | An alias block. Conflicts with ttl & records. Alias record documented below. | `map` | `{}` | no |
| allow\_overwrite | Allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. false by default. This configuration is not recommended for most environments. | `bool` | `false` | no |
| health\_check\_id | The health check the record should be associated with. | `string` | `""` | no |
| multivalue\_answer\_routing\_policy | Set to true to indicate a multivalue answer routing policy. Conflicts with any other routing policy. | `any` | `null` | no |
| name | The name of the record. | `list(string)` | n/a | yes |
| record\_enabled | Whether to create Route53 record set. | `bool` | `true` | no |
| set\_identifier | Unique identifier to differentiate records with routing policies from one another. Required if using failover, geolocation, latency, or weighted routing policies documented below. | `string` | `null` | no |
| ttl | (Required for non-alias records) The TTL of the record. | `number` | `300` | no |
| type | The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT. | `string` | n/a | yes |
| values | (Required for non-alias records) A string list of records. To specify a single record value longer than 255 characters such as a TXT record for DKIM, add "" inside the Terraform configuration string (e.g. "first255characters""morecharacters"). | `string` | `""` | no |
| zone\_id | Zone ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| fqdn | The FQDN |
| name | The record |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->