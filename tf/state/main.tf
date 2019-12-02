provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "${var.tf_state_bucket}"

  versioning {
    enabled = true
  }

  #lifecycle {
    #prevent_destroy = true
  #}
}

resource "aws_s3_bucket_public_access_block" "tf_state_access" {
  bucket = "${aws_s3_bucket.tf_state.id}"

  block_public_acls   = true
  block_public_policy = true
}

resource "aws_dynamodb_table" "tf_state_lock" {
  name           = "app-state"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}