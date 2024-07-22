variable "profile" {
  type    = string
  default = "a1"
}

variable "originating_account_number" {
  type    = string
}

variable "destination_account_number" {
  type    = string
}

variable "role_name_in_destination_account" {
  type    = string
}

provider "aws" {
  region  = "ap-south-1"
  profile = "${var.profile}"
}

