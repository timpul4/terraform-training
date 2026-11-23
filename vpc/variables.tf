variable "name" {
  type = string 
  default = null
}

variable "cidr" {
  type = string
  default = null
}

variable "azs" {
  type = list(string)
  default = []
}

variable "private_subnets" {
  type = list(string)
  default = []
}
variable "private_subnets_names"{
  type = list(string)
  default = []
}


variable "public_subnets" {
  type = list(string)
  default = []
}

variable "public_subnets_names" {
  type = list(string)
  default = []
}

variable "enable_nat_gateway" {
  type = bool
  default = false
}

variable "enable_dns_hostnames" {
  type = bool
  default = false
}



