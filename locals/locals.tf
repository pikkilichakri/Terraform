locals {
  ami_id = data.aws_ami.om-devops-ami.id
  instance_type = "t3.micro"
  name = "${var.project}-${var.environment}-${var.component}"
}

# it locals we can define values , once we define the value , we can reuse  multiple times , if we change  value in locals block , it will be reflected to all blocks 
# it used for redability and expressions
# to restrictions fro the rsources inside the data
# locals can store expressions