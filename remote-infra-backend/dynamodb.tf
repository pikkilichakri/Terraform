# resource "aws_dynamodb_table" "basic-dynamodb-table" {
#   name           = "frontend-dynamod-lock-12389-;ock"
#   billing_mode   = "PAY_PER_REQUEST"
#   hash_key       = "LockID"


#   attribute {
#     name = "LockID"
#     type = "S"
#   }


#   # global_secondary_index {
#   #   name               = "GameTitleIndex"
#   #   hash_key           = "GameTitle"
#   #   range_key          = "TopScore"
#   #   write_capacity     = 10
#   #   read_capacity      = 10
#   #   projection_type    = "INCLUDE"
#   #   non_key_attributes = ["UserId"]
#   # }

#   tags = {
#     Name        = "dynamodb-table-1"
#     Environment = "production"
#   }
# }