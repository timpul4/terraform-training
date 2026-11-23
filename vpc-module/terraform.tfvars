vpcs = [
  {
  name = "test"
  cidr_main = "10.0.0.0/16"

  private_subnets = ["10.0.2.0/24", "10.0.9.0/24"]
  private_subnets_names = ["test1", "test2"]
  public_subnets = ["10.0.1.0/24"]
  public_subnets_names = ["test1"]
  
  enable_nat_gateway = false
  enable_dns_hostnames = false 
  }
]
environment = "test"
