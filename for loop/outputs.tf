# it used for continuously run the  list of items , argeumnts in  for loop

output "ec2_public_ip" {
    value =  [
        for instance in aws_instance.this : instance.public_ip
    ]
}

output "ec2_private_ip" {
    value =  [
        for instance in aws_instance.this : instance.private_ip
    ]
}

output "ec2_public_dns" {
    value =  [
        for instance in aws_instance.this : instance.public_dns
    ]
}

output "ec2_private_dns" {
    value =  [
        for instance in aws_instance.this : instance.private_dns
    ]
}

output "instance_components" {
    value = { key , value in var.instance_tags : key=> upper(value)}   # it is used to dynamically created resoures  or transforming data...
}


# example of transforming a list

# variable "names" {
#   default = ["frontendend", "backend", "mysql"]
# }

# output "uppercase_names" {
#   value = [for name in var.names : upper(name)]    
# }