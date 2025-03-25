resource "aws_instance" "main" {
    ami = "ami-0c15e602d3d6c6c4a"
    instance_type = "t2.micro"
    tags = {
        Name = "main-server-one"
    }
    
    depends_on = [aws_s3_bucket.this]
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_s3_bucket" "this" {
    bucket = "project-om03444-data233"
    tags = {
        Name = "project-data-bucket-one"
    }
}