data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  vpcs = [
    for vpc in var.vpcs : merge(vpc, {
      tags = merge(vpc.tags, { Environment = var.environment })
    })
  ]
}

module "vpcs" {
  
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 6.7"
  
  name = each.value.name
  for_each = { for vpc in local.vpcs : vpc.name => vpc }
  

  cidr = each.value.cidr_main
  
  private_subnets = each.value.private_subnets
  private_subnet_names = each.value.private_subnets_names
  
  public_subnets = each.value.public_subnets
  public_subnet_names = each.value.private_subnets_names
  enable_nat_gateway = each.value.enable_nat_gateway
  enable_dns_hostnames = each.value.enable_dns_hostnames
  
  azs = length(each.value.azs) > 0 ? each.value.azs : data.aws_availability_zones.available.names



tags = merge(
    { 
      "Name" = "${each.value.name}" 
    },
    each.value.tags
  )
}


