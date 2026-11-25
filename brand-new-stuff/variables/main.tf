provider "aws" {
  region = "us-east-2"
}

variable "vpcname" {
  type = string 
  default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
  type = bool
  default = true
}

variable "myList" { // could be used for something like firewall rules or another list of values 
  type = list(string)
  default = [ "Value1", "Value2" ]
}

variable "myMap" {
  type = map 
  default = {
    Key1 = "Value1",
    Key2 = "Value2"
  }
}

variable "inputName" {
  type = string
  description = "Set the name of the VPC" // this is the description that's show when you do the terraform plan command 
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.inputName
  }
}

output "vpcId" {
  value = aws_vpc.myvpc.id
}

variable "myTuple" { // tuple isn't limited to one data type like a list is, so you can have a list of multiple different data types 
  type = tuple([ string, number, string ])
  default = [ "cat", 0, "dog" ]
}

variable "myObject" {
  type = object({
    name = string, 
    port = list(number)
  })
    default = {
        name = "Hayden",
        port = [ 22, 25, 80 ]
    }
}