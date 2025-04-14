provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "quizlet_bucket" {
  bucket = "quizlet-demo-bucket-${random_id.bucket_id.hex}"
  force_destroy = true
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
