# locals {
#     record_name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}
# }