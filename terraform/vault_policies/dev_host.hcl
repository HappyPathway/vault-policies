path "ssh-dev/config/ca" {
  policy = "read"
}

path "secret/dev/*" {
  capabilities = ["create", "update", "read", "list"]
}
