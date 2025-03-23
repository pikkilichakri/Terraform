variable "project" {
    description = "created for expense-project"
    type = string
    default = "expense"
}

variable "environment" {

}

variable "instaces" {

}


variable "zone_id" {
    description = "created for route53 zone id"
    type = string
    default = 
}


variable "domain_name" {
    description = "created for route53 domain name"
    type = string
    default = "omnamahshivaya.online"
}

variable "common_tags {
    description = "created for common tags for merge function use "
    type = map
    default ={
        Project = "expense"
        Environment = 
    }
}