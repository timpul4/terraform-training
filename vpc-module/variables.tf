variable "vpcs" {
  type = list(object({
    name = string
    cidr_main = string
    enable_nat_gateway = optional(bool, false)
    enable_dns_hostnames = optional(bool, false)
    azs = optional(list(string), [])
    public_subnets = optional(list(string), [])
    public_subnets_names = optional(list(string), [])
    private_subnets = optional(list(string), [])
    private_subnets_names = optional(list(string), [])
    tags = optional(map(string), {})
    }))
  default = []
  description = "List vars by vpcs"
}

variable "environment" {
  type = string
  default = null
  description = "Environment"
}

