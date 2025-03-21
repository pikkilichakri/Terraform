output "ec2_info" {
  value       = aws_instance.expense
  #sensitive   = true
  description = "to show the ec2 information"
  #depends_on  = []
}
