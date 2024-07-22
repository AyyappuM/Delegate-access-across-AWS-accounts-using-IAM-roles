resource "aws_s3_bucket" "Sample-S3-Bucket" {
  bucket = "shared-container-${var.destination_account_number}"
}