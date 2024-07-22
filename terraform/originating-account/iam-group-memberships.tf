resource "aws_iam_group_membership" "Developers" {
  name = "members-of-Developers-group"

  users = [
    aws_iam_user.David.name,
  ]

  group = aws_iam_group.Developers.name
}

resource "aws_iam_group_membership" "Analysts" {
  name = "members-of-Analysts-group"
  
  users = [
    aws_iam_user.Jane.name,
  ]

  group = aws_iam_group.Analysts.name
}