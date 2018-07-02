path "ssh-dev/config/ca" {
  capabilities = ["read", "list"]
}

path "ssh-dev/sign/host" {
  capabilities = ["create", "update"]
}

path "aws/creds/ec2_dev" {
  capabilities = ["read", "list"]
}

path "secret/dev/*" {
  capabilities = ["create", "update", "read", "list"]
}
