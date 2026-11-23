output "public_subnet_ids" {
  value = { for name, vpc in module.vpcs : name => vpc.public_subnets }
}

output "private_subnet_ids" {
  value = { for name, vpc in module.vpcs : name => vpc.private_subnets }
}
