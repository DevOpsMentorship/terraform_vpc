variable "aws_region" {
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "vpc_cidr_block"
  type        = string
}

variable "subnet_cidr" {
  default     = "10.0.1.0/24"
  description = "subnet_cidr_block"
  type        = string
}

variable "route_table_cidr" {
  default     = "0.0.0.0/0"
  description = "route_table_cidr_block"
  type        = string
}