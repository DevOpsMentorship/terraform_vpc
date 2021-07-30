variable "aws_region" {
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "vpc_cidr_block"
  type        = string
}

variable "public_subnet_cidr" {
  default     = "10.0.0.0/24"
  description = "public_subnet"
  type        = string
}

variable "route_table_cidr" {
  default     = "0.0.0.0/0"
  description = "route_table_cidr_block"
  type        = string
}

variable "private_subnet_cidr" {
  default     = "10.0.1.0/24"
  description = "private_subnet"
  type        = string
}

variable "ssh_key_path" {
  default     = "./vlad/Desktop/london_region_key_pair.pub"
  description = "path to the public key"
}