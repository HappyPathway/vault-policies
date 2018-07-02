path "ssh-production/config/ca" {
  policy = "read"
}

path "ssh-production/sign/host" {
  capabilities = ["create", "update"]
}

path "secret/production/*" {
  capabilities = ["create", "update", "read", "list"]
}
