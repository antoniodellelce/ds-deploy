
resource "aws_key_pair" "test-key" {
  key_name   = "test-key"
  public_key = file("ssh/key.pub")
}
