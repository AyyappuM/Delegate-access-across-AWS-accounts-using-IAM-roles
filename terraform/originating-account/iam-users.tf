resource "aws_iam_user" "David" {
  name = "David"
}

resource "aws_iam_user_policy_attachment" "allow-assume-S3-role-in-destination-policy-attachment" {
  user       = aws_iam_user.David.name
  policy_arn = aws_iam_policy.allow-assume-S3-role-in-destination-policy.arn
}

resource "aws_iam_user" "Jane" {
  name = "Jane"
}

resource "aws_iam_user_policy_attachment" "deny-assume-S3-role-in-destination-policy-attachment" {
  user       = aws_iam_user.Jane.name
  policy_arn = aws_iam_policy.deny-assume-S3-role-in-destination-policy.arn
}
