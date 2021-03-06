resource "vault_mount" "ssh_dev_mount" {
  path                      = "ssh-dev"
  type                      = "ssh"
  description               = "Enabling SSH Dev"
  default_lease_ttl_seconds = "${var.default_lease_ttl}"
  max_lease_ttl_seconds     = "${var.max_lease_ttl}"
}

# vault write ssh-production/config/ca generate_signing_key=true
resource "vault_generic_secret" "ssh_dev_signing" {
  path      = "ssh-dev/config/ca"
  data_json = "${file("./ssh_roles/generate_signing.json")}"

  depends_on = [
    "vault_mount.ssh_dev_mount",
  ]
}

resource "vault_generic_secret" "ssh_dev_host_signing" {
  path      = "ssh-dev/roles/host"
  data_json = "${file("./ssh_roles/ssh_host_signing.json")}"

  depends_on = [
    "vault_mount.ssh_dev_mount",
  ]
}

resource "vault_generic_secret" "ssh_dev_ubuntu" {
  path      = "ssh-dev/roles/dev"
  data_json = "${file("./ssh_roles/ubuntu.json")}"

  depends_on = [
    "vault_mount.ssh_dev_mount",
  ]
}

resource "vault_generic_secret" "ssh_dev_root" {
  path      = "ssh-dev/roles/root"
  data_json = "${file("./ssh_roles/root.json")}"

  depends_on = [
    "vault_mount.ssh_dev_mount",
  ]
}

resource "vault_mount" "ssh_production_mount" {
  path                      = "ssh-production"
  type                      = "ssh"
  description               = "Enabling SSH Production"
  default_lease_ttl_seconds = "${var.default_lease_ttl}"
  max_lease_ttl_seconds     = "${var.max_lease_ttl}"
}

resource "vault_generic_secret" "ssh_production_signing" {
  path      = "ssh-production/config/ca"
  data_json = "${file("./ssh_roles/generate_signing.json")}"

  depends_on = [
    "vault_mount.ssh_production_mount",
  ]
}

resource "vault_generic_secret" "ssh_production_host_signing" {
  path      = "ssh-production/roles/host"
  data_json = "${file("./ssh_roles/ssh_host_signing.json")}"

  depends_on = [
    "vault_mount.ssh_production_mount",
  ]
}

resource "vault_generic_secret" "ssh_production_ubuntu" {
  path      = "ssh-production/roles/dev"
  data_json = "${file("./ssh_roles/ubuntu.json")}"

  depends_on = [
    "vault_mount.ssh_production_mount",
  ]
}

resource "vault_generic_secret" "ssh_production_root" {
  path      = "ssh-production/roles/root"
  data_json = "${file("./ssh_roles/root.json")}"

  depends_on = [
    "vault_mount.ssh_production_mount",
  ]
}
