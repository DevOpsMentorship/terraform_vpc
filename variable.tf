variable "aws_region" {
  default    = "eu-west-2"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "vpc_cidr_block"
  type        = string
}