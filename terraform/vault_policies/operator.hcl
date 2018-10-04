path "aws/creds/ec2_admin" {
  capabilities = ["read", "list"]
}

# this policy will only allow people to login as ubuntu
path "ssh-dev/sign/dev" {
  capabilities = ["create", "update"]
}

path "ssh-production/sign/*" {
  capabilities = ["create", "update"]
}
