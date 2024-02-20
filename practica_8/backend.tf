# terraform {
#   required_version = ">= 0.12.2"

#   backend "s3" {
#     region         = "us-east-1"
#     bucket         = "example-us-east-1-prod-terraform09022024-state"
#     key            = "terraform.tfstate"
#     dynamodb_table = "example-us-east-1-prod-terraform09022024-state-lock"
#     profile        = ""
#     encrypt        = "true"
#   }
# }
