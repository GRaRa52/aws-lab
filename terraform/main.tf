provider "aws" {
  access_key                  = "hbx"
  secret_key                  = "hbx"
  region                      = "us-east-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3  = "http://localhost:4566"
    sqs = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "lab_bucket" {
  bucket = "bucket-terraform-lab"
}

resource "aws_sqs_queue" "lab_queue" {
  name = "fila-lab"
}

