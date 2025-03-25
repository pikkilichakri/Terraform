replace_triggered_by ,  if a dependent resource(sg , tags, polices) changes, the EC2 instance is replaced.

resource "aws_instance" "main_server" {
  ami           = "ami-0c15e602d3d6c6c4a"
  instance_type = "t2.micro"

  tags = {
    Name = replace( "main-server" , "server" , "instance")   # replace function  is used to dynamically change  the tags in the name section  replace("string", "old", "new")
  }

  lifecycle {
    replace_triggered_by = [
      aws_security_group.main
    ]
  }
}

resource "aws_security_group" "main" {
  name        = "main-sg"
  description = "Security group for main-server-omnamahashivaya"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_instance" "main_ec2" {
#   ami           = "ami-0c15e602d3d6c6c4a"
#   instance_type = "t2.micro"

#   user_data = jsonencode({    #jsonencode() is used  to terraform convert  map or list  into jsondatastring format
#     packages = ["nginx", "git"]
#     commands = [
#       "echo 'Welcome to Terraform' > /var/www/html/index.html",
#       "systemctl start nginx"
#     ]
#   })

#   tags = {
#     Name = "main-server-123"
#   }
# }