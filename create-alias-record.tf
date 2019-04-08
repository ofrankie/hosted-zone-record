variable "aws_region" {
  default = "eu-west-1"
}

data "aws_route53_zone" "selected" {
  name         = "intexp.io."
 # private_zone = true
}

module "terraform-aws-route53-alias" {
  source          = "./modules/terraform-aws-route53-alias-1"
  aliases         = ["dev.${data.aws_route53_zone.selected.name}"]
  parent_zone_id  = "${data.aws_route53_zone.selected.zone_id}"
  target_dns_name = "d1cmjnum02mk9e.cloudfront.net"
  target_zone_id  = "Z2FDTNDATAQYW2"

}  

