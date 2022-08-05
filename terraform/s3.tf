
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "s3-web-test-${var.common_id}"
  acl    = "public-read"

  versioning = {
    enabled = false
  }

}
