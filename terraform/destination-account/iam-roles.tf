resource "aws_iam_role" "UpdateDataRole" {
  name                = var.role_name_in_destination_account
  assume_role_policy  = local.interpolated_trust_policy
}

locals {
  interpolated_trust_policy = templatefile("update-data-role-trust-policy.json", {
    originating_account_number = var.originating_account_number
  })
}

resource "aws_iam_role_policy_attachment" "read-write-app-bucket-policy-attachment" {
  role       = aws_iam_role.UpdateDataRole.name
  policy_arn = aws_iam_policy.read-write-app-bucket-policy.arn
}
