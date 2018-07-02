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
resource "vault_policy" "developer" {
  name   = "developer"
  policy = "${file("vault_policies/developer.hcl")}"
}

# Host Based Roles. 
# Each host will get access only one of these.
# The assumption is that hosts in the dev environment will have access to the dev key
# and host in in the production environment will have access to the production key
resource "vault_policy" "dev" {
  name   = "dev"
  policy = "${file("vault_policies/dev.hcl")}"
}

resource "vault_policy" "production" {
  name   = "production"
  policy = "${file("vault_policies/production_host.hcl")}"
}
