 ###TERRAFORM VARIABLES###

variable "myinputvariable" {
  type=string
  default = "Supriya"
}
output "myoutput" {
  value = "${var.myinputvariable}"
}


##input variables during runtime



variable "myregion" {
  type=string
}
variable "myaccesskey" {
  type=string
}
variable "mysecretkey" {
  type=string
}

provider "aws" {
  region      = "${var.myregion}"
  access_key  = "${var.myaccesskey}"
  secret_key  = "${var.mysecretkey}"
}

 

variable "myinputvariable" {
  type=string
  default = "Supriya"
}
output "myoutput" {
  value = "${var.myinputvariable}"
}

