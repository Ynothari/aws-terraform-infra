terraform {
  backend "s3" {
    bucket         = "my-terraform-state-715841351740"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
