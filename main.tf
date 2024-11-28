

# resource "aws_s3_bucket" "example" {
#   for_each = toset(var.environments)

#   bucket = "my-tfbucket-${each.key}-${var.region}"

#   tags = merge(
#     var.default_tags,
#     {
#       Environment = each.key
#       Name        = "Bucket for ${each.key}"
#     }
#   )
# }

# # Define the sub-folder structure for each environment
# locals {
#   subfolders = {
#     "folder1/subfolder1" = "",
#     "folder1/subfolder2" = "",
#     "folder2/subfolder1" = "",
#     "folder2/subfolder2" = "",
#     "folder3"            = ""
#   }
# }

# # Use for_each to create each sub-folder in each environment's S3 bucket
# resource "aws_s3_object" "subfolders" {
#   for_each = local.subfolders

#   # Create sub-folders in each environment's bucket
#    bucket = "my-tfbuck-${each.key}-${var.region}"
#    key    = "${each.key}/"  # Ensure the key ends with a "/"
#    content = ""
# # This will be the folder path (e.g., "folder1/subfolder1")
 

# }
###############################ATTEMPT-2###############
# # Create S3 buckets for each environment
# resource "aws_s3_bucket" "example" {
#   for_each = toset(var.environments)

#   bucket = "my-tfbucket-${each.key}-${var.region}"

#   tags = merge(
#     var.default_tags,
#     {
#       Environment = each.key
#       Name        = "Bucket for ${each.key}"
#     }
#   )
# }

# # Define the sub-folder structure for each environment
# locals {
#   subfolders = {
#     "folder1/subfolder1" = "",
#     "folder1/subfolder2" = "",
#     "folder2/subfolder1" = "",
#     "folder2/subfolder2" = "",
#     "folder3"            = ""
#   }
# }

# # Use for_each to create sub-folders in each environment's S3 bucket
# resource "aws_s3_object" "subfolders" {
#   for_each = toset(local.subfolders)

#   # Create sub-folders in each environment's bucket
#   bucket = aws_s3_bucket.example[each.key].bucket
#   key    = "${each.value}/" # Ensure folder path ends with '/'
#   content = "" # Empty content to simulate a folder
# }
###############################ATTEMPT-3###############
# Create S3 buckets for each environment
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

# Define the sub-folder structure
locals {
  subfolders = [
    "folder1/subfolder1",
    "folder1/subfolder2",
    "folder2/subfolder1",
    "folder2/subfolder2",
    "folder3"
  ]
}

# Create sub-folders in each environment's S3 bucket
resource "aws_s3_object" "subfolders" {
  for_each = tomap({ for idx, folder in local.subfolders : idx => folder })

  bucket = aws_s3_bucket.example[var.current_environment].bucket
  key    = "${each.value}/" # Ensure the key ends with '/'
  content = "" # Empty content to simulate a folder

  depends_on = [aws_s3_bucket.example]
}
