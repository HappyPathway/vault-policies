resource "vault_okta_auth_backend" "okta" {
  description  = "Configuring OKTA Authentication"
  organization = "${var.okta_org}"
  token        = "${var.okta_token}"

  group {
    group_name = "admin"
    policies   = ["admin"]
  }

  group {
    group_name = "operators"
    policies   = ["operator"]
  }

  group {
    group_name = "developers"
    policies   = ["developer"]
  }
}

resource "vault_okta_auth_backend_group" "admin" {
  path       = "${vault_okta_auth_backend.okta.path}"
  group_name = "admin"
  policies   = ["default", "admin"]
}

resource "vault_okta_auth_backend_group" "operator" {
  path       = "${vault_okta_auth_backend.okta.path}"
  group_name = "operators"
  policies   = ["default", "operator"]
}

resource "vault_okta_auth_backend_group" "developer" {
  path       = "${vault_okta_auth_backend.okta.path}"
  group_name = "developers"
  policies   = ["default", "developer"]
}
