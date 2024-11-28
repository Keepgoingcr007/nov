# resource "aws_s3_bucket" "example" {
#   for_each = toset(var.environment)

#   bucket = "my-tfbucket-${each.key}-${var.region}"

#   tags = merge(
#     var.default_tags,
#     {
#       Environment = each.key
#       Name        = "Bucket for ${each.key}"
#     }
#   )
# }
variable "region" {
  default     = "us-east-1"
  description = "This is my AWS region"
}

variable "environments" {
  description = "List of environments for which to create S3 buckets"
  type        = list(string)
  default     = ["dev", "stag", "prod"]
}

variable "default_tags" {
  description = "Default tags to apply to all buckets"
  type        = map(string)
  default     = {
    Owner   = "Deep"
    Project = "book"
  }
}

resource "aws_s3_bucket" "example" {
  for_each = toset(var.environments)

  bucket = "my-tfbucket-${each.key}-${var.region}"

  tags = merge(
    var.default_tags,
    {
      Environment = each.key
      Name        = "Bucket for ${each.key}"
    }
  )
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}
