#  Create Ec2 Instance through Terraform  code
resource "aws_instance" "this" {
  #count = 2
  ami                    = var.ami_id # This is our DevOps ami  id  #  each  id = 17 characters of string , it is alpha numeric format of string
  #vpc_security_group_ids = [aws_security_group.allow_tls_sg_ec2.id]
  security_groups = [aws_security_group.allow_tls_sg_ec2.name]
#   instance_type   =  var.environment == "prod" ? "t3.small" : "t2.micro"
  for_each = tomap({
    "terraform-automation-micro1" = "t2.micro"
    "terraform-automation-micro2" = "t3.micro"
  })

  instance_type = each.value
  root_block_device {
    volume_type = "gp3"
    volume_size = 21
  }
  
  tags = {
    Name = each.key
    #Key = Value
  }
}


# Create Security Group through Terraform code 
resource "aws_security_group" "allow_tls_sg_ec2" {
  name        = "allow_tls_sg_ec2"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = var.sg_tags

  ingress {

    from_port   = var.ingress_from_port  
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_blocks
  }

  egress {

    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

}



# it is oneline terraform code
# resource "aws_security_group" "allow_tls" { name="allow_tls" description="Allow TLS inbound traffic and all outbound traffic" tags={ Name="allow_tls" } }


# conditions:-  if ,else , when  ( if we make decision based on will perform )

# general syntax:-
# ------------------
# if (expression) {
#   # this statement run if condition is true
# else
#   # this statement run if condition is false
# }

# terraform follow syntax:- ternary operator

# expression ? "this statement run if condition is true" : "this statement run if condition is false"


# if dev environment   you can choose t3.micro , other wise t2.micro

# if prod environment you can choose  t3.small , otherwise t2.micro

#  instance_type =  var.environment == prod ? "t3.small" : "t2.small"

