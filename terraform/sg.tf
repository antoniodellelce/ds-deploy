module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name   = "web-server"
  vpc_id = local.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}
module "ssh_sg" {

  source = "terraform-aws-modules/security-group/aws//modules/ssh"

  name   = "sshd"
  vpc_id = local.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}
