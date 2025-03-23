output "ami" {
    value = data.aws_ami.om-devops-ami.id
    description = "To fetch the ami id from data sources"
}

output "default_vpc_id" {
    value = data.aws_vpc.default.id
}

# output "default_sg_id" {
#     value = data.aws_security_group.default.id
# }

