resource "aws_key_pair" "hitc" {
  key_name   = "hitc"
  public_key = var.ssh_pub_key_file
}
