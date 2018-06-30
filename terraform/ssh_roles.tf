resource "vault_mount" "ssh_dev_mount" {
  path        = "ssh-dev"
  type        = "ssh"
  description = "Enabling SSH Dev"
}

resource "vault_mount" "ssh_production_mount" {
  path        = "ssh-production"
  type        = "ssh"
  description = "Enabling SSH Production"
}

# vault write ssh-production/config/ca generate_signing_key=true
resource "vault_generic_secret" "ssh_dev_signing" {
  path      = "ssh-production/config/ca"
  data_json = "${file("./ssh_roles/generate_signing.json")}"
}

resource "vault_generic_secret" "ssh_production_signing" {
  path      = "ssh-production/config/ca"
  data_json = "${file("./ssh_roles/generate_signing.json")}"
}

resource "vault_generic_secret" "ssh_dev_ubuntu" {
  path      = "ssh-dev/roles/dev"
  data_json = "${file("./ssh_roles/ubuntu.json")}"
}

resource "vault_generic_secret" "ssh_dev_root" {
  path      = "ssh-dev/roles/root"
  data_json = "${file("./ssh_roles/root.json")}"
}

resource "vault_generic_secret" "ssh_production_ubuntu" {
  path      = "ssh-production/roles/dev"
  data_json = "${file("./ssh_roles/ubuntu.json")}"
}

resource "vault_generic_secret" "ssh_production_root" {
  path      = "ssh-production/roles/root"
  data_json = "${file("./ssh_roles/root.json")}"
}
