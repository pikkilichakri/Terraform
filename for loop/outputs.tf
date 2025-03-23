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