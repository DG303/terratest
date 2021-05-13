terraform {
  backend "s3" {
    bucket         = ""
    key            = "terratest/test/terraform.tfstate"
    region         = ""
    dynamodb_table = ""
    encrypt        = true
    kms_key_id     = ""
  }
  required_version = "= 0.14.9"
}
