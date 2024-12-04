resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_user" "test" {
  name = "test"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}