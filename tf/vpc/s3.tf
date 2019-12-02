# Create S3 bucket for kops state
resource "aws_s3_bucket" "kops_s3_bucket" {
  bucket = "${var.kops_s3_bucket}"
  acl    = "private"

  tags = {
    Name    = "kops_s3_bucket"
    env     = "admin"
  }
}

resource "aws_s3_bucket_public_access_block" "kops_3_bucket" {
  bucket = "${aws_s3_bucket.kops_s3_bucket.id}"

  block_public_acls   = true
  block_public_policy = true
}