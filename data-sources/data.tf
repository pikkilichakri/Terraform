# data sources:- to query the existing information from the provider like ami-id's , vpc's , sg's .........
# to take the latest ami , because any changes in your  ami  , latest best thing.. , terraform reads run time pick

data "aws_ami" "om-devops-ami" {
    most_recent      = true
    owners           = ["973714476881"]
    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_vpc" "default" {
  default = true  # it is default vpc
}

# data "aws_security_group" "default" {
#  filter {
#     name   = "group-name"
#     values = ["default"]
#   }

# }



