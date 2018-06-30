path "aws/creds/ec2_admin" {
  policy = "read"
}

# this policy will only allow people to login as ubuntu
path "ssh-dev/sign/dev" {
  policy = "write"
}

path "ssh-production/sign/dev" {
  policy = "write"
}
