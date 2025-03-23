variable "project" {
    description = "created for expense project"
    type = string
    default = "expense"
}

variable "environment" {
    description = "created for environment"
    type = string
    default = "dev"
}

variable "component" {
    description = "created for the component"
    type = string
    default = "backend"
}


# variable "name" {
#     description = "created for the expense-dev-backend project"
#     type = string
#     default = "${var.project}-${var.environment}-${var.component}"
# }
