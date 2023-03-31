resource "aws_ssm_parameter" "test_key" {
  type  = "SecureString"
  name  = "${var.env}/test_key"
  value = "${var.test-secrets}".data["test_key"]
}
