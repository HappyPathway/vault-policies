resource "vault_aws_secret_backend" "aws" {
  access_key                = "${var.aws_access_key}."
  secret_key                = "${var.aws_secret_key}"
  default_lease_ttl_seconds = "${var.default_lease_ttl}"
  max_lease_ttl_seconds     = "${var.max_lease_ttl}"
}

# IAM Roles that Vault creates when aws backend is read with appropriate Vault Token
resource "vault_aws_secret_backend_role" "ec2_admin" {
  backend = "${vault_aws_secret_backend.aws.path}"
  name    = "ec2_admin"
  policy  = "${file("./iam_roles/ec2_admin.json")}"
}

resource "vault_aws_secret_backend_role" "ec2_dev" {
  backend = "${vault_aws_secret_backend.aws.path}"
  name    = "ec2_dev"
  policy  = "${file("./iam_roles/ec2_dev.json")}"
}

# User Based Roles
# Admins will be able to login as root to all hosts
# They will also have Full Access to EC2.
resource "vault_policy" "admin" {
  name   = "admin"
  policy = "${file("vault_policies/admin.hcl")}"
}

# Operators will Full Access to EC2 but only user level access to hosts
resource "vault_policy" "operator" {
  name   = "operator"
  policy = "${file("vault_policies/operator.hcl")}"
}

# Dev Users will have ReadOnly Access to EC2 and user level access to hosts
resource "vault_policy" "dev_user" {
  name   = "developer"
  policy = "${file("vault_policies/dev.hcl")}"
}

# Host Based Roles. 
# Each host will get access only one of these.
# The assumption is that hosts in the dev environment will have access to the dev key
# and host in in the production environment will have access to the production key
resource "vault_policy" "dev_host" {
  name   = "dev"
  policy = "${file("vault_policies/dev_host.hcl")}"
}

resource "vault_policy" "production" {
  name   = "production"
  policy = "${file("vault_policies/production_host.hcl")}"
}

resource "vault_generic_secret" "ssh_dev_ubuntu" {
  path      = "ssh-dev/roles/dev"
  data_json = "${file("./ssh_roles/ubuntu.json")}"
}

resource "vault_generic_secret" "ssh_dev_root" {
  path      = "ssh-dev/roles/root"
  data_json = "${file("./ssh_roles/root.json")}"
}

resource "vault_generic_secret" "ssh_production_ubuntu" {
  path      = "ssh-production/roles/dev"
  data_json = "${file("./ssh_roles/ubuntu.json")}"
}

resource "vault_generic_secret" "ssh_production_root" {
  path      = "ssh-production/roles/root"
  data_json = "${file("./ssh_roles/root.json")}"
}
