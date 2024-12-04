
variable "region" {
  default     = "us-east-1"
  description = "This is my AWS region"
}

variable "environments" {
  description = "List of environments for which to create S3 buckets"
  type        = list(string)
  default     = ["dev", "stag", "prod"]
}
variable "current_environment" {
  description = "The current environment (e.g., dev, stag, prod)"
  type        = string
}


variable "default_tags" {
  description = "Default tags to apply to all buckets"
  type        = map(string)
  default     = {
    Owner   = "Deep"
    Project = "book"
  }
}