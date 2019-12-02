data "terraform_remote_state" "env" {
  backend = "s3"

  config {
    bucket = "${var.tf_state_bucket}"
    key    = "${var.tf_state_bucket_key}"
    region = "${var.region}"
  }
}

provider "aws" {
  region = "${var.region}"
}

