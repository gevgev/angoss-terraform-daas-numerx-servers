resource "aws_key_pair" "deployer-daas-numerx" {
  key_name = "numerx-dev-deployer-key"
  public_key = "${file(\"ssh/numerx-dev-deployer-key.pub\")}"
}
