resource "aws_route53_record" "expense_record" {
    count = length(var.instances)   #  use it to iterate  lists
    zone_id = var.zone_id
    name = "${var.instances[count.index]}.${var.domain_name}"  # it is interploation  means you can concat  variables with text
    type = "A"
    ttl = 1
    records = [aws_instance.expense[count.index].private_ip]
    allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
    count = length(var.instances)
    zone_id = var.zone_id
    name = "${var.domain_name}"  # it is interploation  means you can concat  variables with text
    type = "A"
    ttl = 1
    records = [aws_instance.expense[2].public_ip]
    allow_overwrite = true
}