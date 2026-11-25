provider "aws" {
  region = "us-east-2"
}

// the name is not somethinig that will name the resource it's for our own internal use in the terraform code
// making a new vpc now 
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "TerraformVPC"
  }
}