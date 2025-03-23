 # provisioners are used to  execute commands or secripts in terraform  managed resources on local and remote 
 # 2 types :-  1.local-exec   2. remote-exec
#  local-exec:- where terraform  commands is running  that is local
#  remote-exec:- inside the server created by terraform
 # only run in creation time , not work their update 
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
#   key_name = aws_key_pair.om_key.key_name  # Interploation :- it we can extrac the values from terraform resource block
  instance_type          = "t2.micro"
  security_groups = [aws_security_group.allow_tls.name]
#   root_block_device {
#     volume_size = 13
#     volume_type = "gp3"
#   }
  provisioner "local-exec" {
    command = " echo The server's IP address is :: ${self.private_ip} > inventory"
    # on_failure = continue  # ignore the error and continue with creation 
    # when = destroy
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
    timeout     = "10m"
  }

  provisioner "remote-exec" {
    inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
        "sudo systemctl stop nginx"
    ]
  }
#   user_data = file("install_nginx.sh")
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
    description = "ssh open"
  }

  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "nginx port  open"
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all open"
  }

}


# it is oneline terraform code
# resource "aws_security_group" "allow_tls" { name="allow_tls" description="Allow TLS inbound traffic and all outbound traffic" tags={ Name="allow_tls" } }