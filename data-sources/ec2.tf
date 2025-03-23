# syntax:- 
# resource "type_of_resource" "name-of-resource" {

#   # you can give parameters or arguments (key="value")

# }


#  Create Ec2 Instance through Terraform  code
resource "aws_instance" "this" {
  ami                    = data.aws_ami.om-devops-ami.id # This is our DevOps ami  id  #  each  id = 17 characters of string , it is alpha numeric format of string
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t2.micro"
  tags = {
    #Key = Value
    Name    = "terraform-aws_instance"
    Purpose = "create ec2-instance through terraform code"
  }

}


# Create Security Group through Terraform code 
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = {
    Name = "allow_tls"
  }

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


# it is oneline terraform code
# resource "aws_security_group" "allow_tls" { name="allow_tls" description="Allow TLS inbound traffic and all outbound traffic" tags={ Name="allow_tls" } }
