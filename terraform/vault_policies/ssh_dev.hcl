# this policy will only allow people to login as ubuntu
path "ssh-dev/sign/ubuntu" {
  policy = "write"
}

path "ssh-dev/config/ca" {
  policy = "read"
}
