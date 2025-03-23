# syntax:- 
# resource "type_of_resource" "name-of-resource" {

#   # you can give parameters or arguments (key="value")

# }


#  Create Ec2 Instance through Terraform  code


# Key-pair section 

# resource "aws_key_pair" "om_key" {
#   key_name = "om123-key"
#   public_key = file("C:/intel/om-333.pub")  # correct path to actual public-key file

# }

resource "aws_instance" "this" {
  ami                    = "ami-09c813fb71547fc4f" # This is our DevOps ami  id  #  each  id = 17 characters of string , it is alpha numeric format of string
  #vpc_security_group_ids = [aws_security_group.allow_tls.id]
  # key_name = aws_key_pair.om_key.key_name  # Interploation :- it we can extrac the values from terraform resource block
  instance_type          = "t2.micro"
  security_groups = [aws_security_group.allow_tls.name]
  root_block_device {
    volume_size = 21
    volume_type = "gp3"
  }
  #user_data = file("install_nginx.sh")
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

   dynamic "ingress" { # Terraform will give you a keyword with the block name. You can iterate using ingress.
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
    # content {
    #   description = "created for all ports"
    #   from_port   = ingress.value.port
    #   to_port     = ingress.value.port
    #   protocol    = "tcp"
    #   cidr_blocks = ["0.0.0.0/0"]
    # }

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    ipv6_cidr_blocks = []  #::/0
    prefix_list_ids = []
    security_groups =[]
    self = false
    cidr_blocks = ["0.0.0.0/0"]
    description = "all open"
  }

}


# it is oneline terraform code
# resource "aws_security_group" "allow_tls" { name="allow_tls" description="Allow TLS inbound traffic and all outbound traffic" tags={ Name="allow_tls" } }
