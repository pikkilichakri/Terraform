# alias-provider it is typically used  to define multiple instance of same provider with different multiple configuartions ,  deploy resources across multiple regions or accounts using provider aliases.

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

resource "aws_instance" "east_instance" {
  provider      = aws
  ami          = "ami-04aa00acb1165b32a" # Example AMI
  instance_type = "t2.micro"

  tags = {
    Name = "East-Instance"
  }
}

resource "aws_instance" "west_instance" {
  provider      = aws.west
  ami          = "ami-0520f976ad2e6300c" # us-west-2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "West-Instance"
  }
}
