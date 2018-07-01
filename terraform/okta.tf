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

resource "vault_okta_auth_backend_user" "admin" {
  path     = "${vault_okta_auth_backend.okta.path}"
  username = "admin"
  groups   = ["admin"]
}

resource "vault_okta_auth_backend_user" "operator" {
  path     = "${vault_okta_auth_backend.okta.path}"
  username = "operator"
  groups   = ["operator"]
}

resource "vault_okta_auth_backend_user" "developer" {
  path     = "${vault_okta_auth_backend.okta.path}"
  username = "developer"
  groups   = ["developer"]
}
