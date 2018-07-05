resource "vault_auth_backend" "approle" {
  type = "approle"
}

resource "vault_approle_auth_backend_role" "approle" {
  backend   = "${vault_auth_backend.approle.path}"
  role_name = "12factor"
  policies  = ["default", "12factor"]
}

resource "vault_approle_auth_backend_role_secret_id" "id" {
  backend   = "${vault_auth_backend.approle.path}"
  role_name = "${vault_approle_auth_backend_role.approle.role_name}"
  metadata  = "${file(var.approle_metadata)}"
}
