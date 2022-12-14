module "ec2_instance_backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "backend"

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "test-key"
  monitoring             = true
  vpc_security_group_ids = [module.web_server_sg.security_group_id, module.ssh_sg.security_group_id]
  subnet_id              = local.public_subnets[0]

  user_data = base64encode(file("setup-backend.sh"))

  tags = {
    Terraform   = "true"
    Environment = "test"
  }
}
