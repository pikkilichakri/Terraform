resource "aws_instance" "main" {
    ami = "ami-0c15e602d3d6c6c4a"
    instance_type = "t2.micro"
    tags = {
        Name = "main-server"
    }
    lifecycle {
        create_before_destroy = true
    }
}