resource "aws_instance" "main" {
    ami = "ami-04aa00acb1165b32a"
    instance_type = "t2.micro"
    tags = {
        Name = "main-server"
    }
    lifecycle {
        ignore_changes = [tags.Name]
    }
}