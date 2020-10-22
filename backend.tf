terraform {
  backend "s3" {
    bucket = "mackah-s3-terraform-bucket"
    key    = "mackah-s3-terraform-bucket/terraform"
    region = "eu-west-1"
  }
}