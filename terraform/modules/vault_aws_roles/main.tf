resource "vault_aws_secret_backend_role" "role" {
  backend = "${var.backend}"
  name    = "${var.role_name}"

  policy = "${file(var.policy_file)}"
}
