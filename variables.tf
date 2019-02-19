variable "secret_key" {
  description = "The AWS secret key"
}

variable "access_key" {
  description = "The AWS access key"
}

variable "region" {
  description = "The AWS region"
  default = "ca-central-1"
}

variable "region_list" {
  type = "list"
  description = "AWS availability zone"
  default = ["ca-central-1a", "ca-central-1b"]
}


variable "AMI" {
  type = "map"
  description = "The AMI's to use."
  default = {
    ca-cental-1 =""
    ca-central-2=""
  }
}