resource "vault_auth_backend" "aws" {
  type = "aws"
}

resource "vault_aws_auth_backend_role" "admin" {
  backend                        = "${vault_auth_backend.aws.path}"
  role                           = "Darnold-Hashicorp-production"
  auth_type                      = "iam"
  bound_account_id               = "753646501470"
  bound_iam_role_arn             = "arn:aws:iam::753646501470:role/Darnold-Hashicorp-production"
  bound_iam_instance_profile_arn = "arn:aws:iam::753646501470:instance-profile/Darnold-Hashicorp-production"
  inferred_entity_type           = "ec2_instance"
  inferred_aws_region            = "us-east-1"
  ttl                            = 60
  max_ttl                        = 120
  policies                       = ["default", "dev", "production"]
}
