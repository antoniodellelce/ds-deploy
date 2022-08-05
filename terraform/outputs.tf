
output "s3_address" {
  value = module.s3_bucket.s3_bucket_bucket_domain_name
}


output "ec2_backend_ip" {
  value = module.ec2_instance.public_ip
}
