variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This is RHEL9 ami-id"
}

variable "zone_id" {
    type = string
    default = "Z0104948ZZR58608SP7I"
}

variable "domain_name" {
    type = string
    default = "omnamahashivaya.online"
}


variable "instance_type" {
  type        = list(string)
  default     = ["t2.micro" , "t3.medium" , "t3.small"]
  description = "To create a set of unique instance types"
}

variable "instance_tags" {
    type = map(string)
    default = {
        Project = "expense"
        Component = "backend"
        Environment = "dev"
        Name = "expense-backend-dev"
    }
    description = "This is tags for ec2-instance"
}

variable "instances" {
    type = list(string)
    default = ["mysql" , "backend" , "frontend"]
    description = "create 3 instances for expense project"
}
variable "ingress_from_port" {
    type = number
    default = 22
}

variable "ingress_to_port" {
    type = number
    default = 22
}

variable "ingress_protocol" {
    type = string
    default = "tcp"
}

variable "ingress_cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "common_tags" {
    type = map(string)
    default = {
        Project = "expense"
        Environment = "dev"
        Component = "backend"
        Terraform = "true"

    }
}


variable "egress_from_port" {
    type = number
    default = 0
}

variable "egress_to_port" {
    type = number
    default = 0
}

variable "egress_protocol" {
    type = string
    default = "-1"
}

variable "egress_cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    type = map(string)
    default = {
        Project = "expense"
        Component = "backend"
        Environment = "dev"
        Name = "expense-backend-dev-sg"
    }
    description = "This is tags for security-group"
}



# variables preferences:-
# -------------------------

# 1. command line  ( terraform apply -var="instance_type=t2.micro")
# 2. terraform.tfvars ( instance_type = "t3.micro")
# 3. Terraform ENV VARS ( export TF_VAR_instance_type = "t3.small")
# 4. default vars( variables.tf)
# 5. User Prompt