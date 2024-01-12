variable "nv_cidr" {
    description = "CIDR virginia"
    type = string
}

# variable "public_subnet" {
#   description = "CIDR public subnet"
#   type = string
# }

# variable "private_subnet" {
#   description = "CIDR private subnet"
#   type = string
# }

variable "subnet" {
  description = "Lista de subnets"
  type = list(string)
}

variable "tags" {
  description = "tags del proyecto"
  type = map(string)
}