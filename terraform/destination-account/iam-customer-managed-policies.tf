resource "aws_iam_policy" "read-write-app-bucket-policy" {
  name        = "read-write-app-bucket"
  policy      = local.interpolated_permission_policy
}

locals {
  interpolated_permission_policy = templatefile("read-write-app-bucket-policy.json", {
    destination_account_number = var.destination_account_number
  })
}
