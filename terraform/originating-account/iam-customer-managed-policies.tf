resource "aws_iam_policy" "allow-assume-S3-role-in-destination-policy" {
  name        = "allow-assume-S3-role-in-destination"
  policy      = local.allow_interpolated_policy
}

locals {
  allow_interpolated_policy = templatefile("allow-assume-S3-role-in-destination-policy.json", {
    destination_account_number = var.destination_account_number,
    role_name_in_destination_account = var.role_name_in_destination_account
  })
}

resource "aws_iam_policy" "deny-assume-S3-role-in-destination-policy" {
  name        = "deny-assume-S3-role-in-destination"
  policy      = local.deny_interpolated_policy
}

locals {
  deny_interpolated_policy = templatefile("deny-assume-S3-role-in-destination-policy.json", {
    destination_account_number = var.destination_account_number,
    role_name_in_destination_account = var.role_name_in_destination_account
  })
}
