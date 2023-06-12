# # check if the s3 bucket is already exists
# data "aws_s3_bucket" "existing_bucket" {
#   bucket = "s3statebucket123456"
# }

# create s3
# resource "aws_s3_bucket" "terraform_state_bucket" {

#   count = data.aws_s3_bucket.existing_bucket != null ? 0 : 1

#   bucket = "s3statebucket123456"
#   versioning {
#     enabled = true
#   }
#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

# }

# check if the dynamodb table is already exists
# data "aws_dynamodb_table" "existing_dynamodb_table" {
#   name = "state-lock"
# }

# # create dynamodb table
# resource "aws_dynamodb_table" "terraform_state_lock" {

#   count = data.aws_dynamodb_table.existing_dynamodb_table != null ? 0 : 1

#   name         = "state-lock"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }


# Create an S3 bucket for Terraform state storage
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "s3statebucket123456"
}

# Create a DynamoDB table for Terraform state locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
