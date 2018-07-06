path "secret/serverpool/*" {
  capabilities = ["read", "list", "create", "update"]
}

path "auth/token/create" {
  capabilities = ["create", "update"]
}
