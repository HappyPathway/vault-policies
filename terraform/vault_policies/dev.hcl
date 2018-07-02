path "aws/creds/ec2_dev" {
  capabilities = ["read", "list"]
}

# this policy will only allow people to login as ubuntu
path "ssh-dev/sign/dev" {
  capabilities = ["create", "update"]
}

path "secret/dev/*" {
  capabilities = ["create", "update", "read", "list"]
}
