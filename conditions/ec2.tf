# syntax:- 
# resource "type_of_resource" "name-of-resource" {

#   # you can give parameters or arguments (key="value")

# }


#  Create Ec2 Instance through Terraform  code
resource "aws_instance" "this" {
  ami                    = var.ami_id # This is our DevOps ami  id  #  each  id = 17 characters of string , it is alpha numeric format of string
  vpc_security_group_ids = [aws_security_group.allow_tls_sg_ec2.id]
  instance_type          =  var.environment == "prod" ? "t3.small" : "t2.micro"
  tags = var.instance_tags
    #Key = Value
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

