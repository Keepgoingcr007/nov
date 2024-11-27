
resource "aws_api_gateway_rest_api" "api" {
 
  name        = "Deepak-terraform"
  description = "This is my API for demonstration purposes"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "resource" {
  for_each = { for idx, res in var.api_resources : res.resource_name => res }

  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = each.value.resource_name
}

resource "aws_api_gateway_method" "method" {
  for_each = {
    for res in var.api_resources : 
    for method in res.methods :
    "${res.resource_name}-${method}" => {
      resource_name = res.resource_name
      method        =method
    }
  }

  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.resource[each.value.resource_name].id
  http_method   = each.value.method
  authorization = "NONE"
}





