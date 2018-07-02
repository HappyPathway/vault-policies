path "ssh-dev/config/ca" {
  capabilities = ["read", "list"]
}

path "aws/creds/ec2_dev" {
  capabilities = ["read", "list"]
}

path "secret/dev/*" {
  capabilities = ["create", "update", "read", "list"]
}
