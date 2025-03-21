# syntax:- 
# resource "type_of_resource" "name-of-resource" {

#   # you can give parameters or arguments (key="value")

# }


#  Create Ec2 Instance through Terraform  code
resource "aws_instance" "expense" {
  count = length(var.instances)
  ami                    = var.ami_id # This is our DevOps ami  id  #  each  id = 17 characters of string , it is alpha numeric format of string
  vpc_security_group_ids = [aws_security_group.allow_tls_sg_expense.id]
  # set() used to create a set of unique values
  #vpc_security_group_ids = toset([aws_security_group.allow_tls_sg_expense.id, aws_security_group.allow_tls_project.id])
  instance_type          =  element(var.instance_type, count.index)
  tags = merge(                              #merge("map1", "map2")
    var.common_tags, # map
    {
      Name = var.instances[count.index] #map
    }
    #Key = Value
  )
}


# Create Security Group through Terraform code 
resource "aws_security_group" "allow_tls_sg_expense" {
  name        = "allow_tls_sg_expense"
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
