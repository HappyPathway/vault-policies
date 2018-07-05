resource "vault_mount" "transit_mount" {
  path                      = "transit"
  type                      = "transit"
  description               = "Enabling Transit Secrets engine"
  default_lease_ttl_seconds = "${var.default_lease_ttl}"
  max_lease_ttl_seconds     = "${var.max_lease_ttl}"
}
