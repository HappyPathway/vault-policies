path "ssh-production/config/ca" {
  policy = "read"
}

path "secret/production/*" {
  capabilities = ["create", "update", "read", "list"]
}
