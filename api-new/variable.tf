variable "api_resources" {
  type = list(object({
    resource_name = string
    methods  = list(string)
  }))
  default = [
    {
      resource_name = "agent"
      methods  = ["GET", "POST"]
    },
    {
      resource_name = "employer"
      methods  = ["PUT", "DELETE"]
    }
  ]
}
# #
# variable "api_resources" {
#   default = [
#     {
#       resource_name = "agent"
#       methods       = ["GET", "POST"]
#     },
#     {
#       resource_name = "employer"
#       methods       = ["PUT", "DELETE"]
#     }
#   ]
# }
