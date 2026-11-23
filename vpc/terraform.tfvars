name = "my-vpc"

cidr = "10.0.0.0/16"

public_subnets = ["10.0.2.0/24", "10.0.5.0/24"]
public_subnets_names = ["public", "public2"]

private_subnets = ["10.0.3.0/24", "10.0.10.0/24"]
private_subnets_names = ["private", "private2"]

enable_dns_hostnames = "true" 
