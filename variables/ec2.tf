# syntax:- 
# resource "type_of_resource" "name-of-resource" {

#   # you can give parameters or arguments (key="value")

# }


#  Create Ec2 Instance through Terraform  code
resource "aws_instance" "this" {
  ami                    = var.ami_id # This is our DevOps ami  id  #  each  id = 17 characters of string , it is alpha numeric format of string
  vpc_security_group_ids = [aws_security_group.allow_tls_sg.id]
  instance_type          =  var.instance_type
  tags = var.instance_tags
    #Key = Value
}


# Create Security Group through Terraform code 
resource "aws_security_group" "allow_tls_sg" {
  name        = "allow_tls_sg"
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
