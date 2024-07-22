resource "aws_iam_group" "Developers" {
  name = "Developers"
  path = "/users/"
}

resource "aws_iam_group" "Analysts" {
  name = "Analysts"
  path = "/users/"
}
