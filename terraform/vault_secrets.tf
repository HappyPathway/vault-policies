resource "vault_generic_secret" "dev_secret" {
  path      = "secret/dev/top_secret"
  data_json = "${file("./secrets/dev.json")}"
}

resource "vault_generic_secret" "production_secret" {
  path      = "secret/production/top_secret"
  data_json = "${file("./secrets/production.json")}"
}
