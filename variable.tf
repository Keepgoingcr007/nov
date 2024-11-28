# variable "region" {
#   default = "us-east-1"
#   description = "this is my aws region"
# }

# variable "s3_buckets" {
#   description = "Map of bucket names and descriptions"
#   type        = map(string)
# }

# variable "environment" {
#   description = "Environment name (e.g., dev, uat, prod)"
#   type        =list(string) 
#   default = ["dev","stag","prod"]
# }

# variable "default_tags" {
#   description = "Default tags to apply to all buckets"
#   type        = map(string)
#   default     = {
#     Owner   = "Deep"
#     Project = "book"
#   }
# }

