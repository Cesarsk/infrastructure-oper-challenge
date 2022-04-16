resource "aws_s3_bucket" "oper_staging" {
  bucket = var.oper_staging_bucket
  acl    = "private"

  versioning {
    enabled = false
  }

  tags = var.tags
}

resource "aws_s3_bucket" "oper_terraform_state" {
  bucket = var.oper_terraform_state
  acl    = "private"

  versioning {
    enabled = false
  }

  tags = var.tags
}