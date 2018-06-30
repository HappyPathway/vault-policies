# this policy will only allow people to login as ubuntu
path "ssh-dev/sign/root" {
  policy = "write"
}

path "ssh-production/sign/root" {
  policy = "write"
}
