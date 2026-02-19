variable "localstack_endpoint" {
  description = "LocalStack endpoint URL"
  type        = string
  default     = "http://localhost:4566"
}

provider "aws" {
  access_key = "hbx"
  secret_key = "hbx"
  region     = "us-east-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3  = var.localstack_endpoint
    sqs = var.localstack_endpoint
    iam = var.localstack_endpoint
  }
}

resource "aws_s3_bucket" "lab_bucket" {
  bucket = "bucket-terraform-lab"
}

resource "aws_sqs_queue" "lab_queue" {
  name = "fila-lab"
}

resource "aws_sqs_queue" "nova_fila" {
  name = "fila-pedidos"
}
