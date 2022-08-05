variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "common_id" {
  type    = string
  default = "demandscience"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
