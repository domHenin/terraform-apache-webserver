variable "aws_region" {
  description = "region for infrastructure"
  default     = "us-east-1"
  type        = string
}

variable "vpc_name" {
  description = "name for vpc"
  default     = "vpc_webserver"
  type        = string
}

variable "vpc_cidr" {
  description = "cidr range for vpc"
  default     = "10.0.0.0/16"
  type        = string
}

variable "azs_region" {
  description = "region for azs"
  default     = "us-east-1a"
  type        = string
}

variable "pub_sub_cidr" {
  description = "cidr range for public subnet"
  default     = "172.69.1.0/16"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  default     = "t3.micro"
  type        = string
}


variable "rules" {
  type = list(object({
    port        = number
    proto       = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      port        = 80
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 22
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 3689
      proto       = "tcp"
      cidr_blocks = ["6.7.8.9/32"]
    }
  ]
}