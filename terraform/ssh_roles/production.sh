#!/bin/bash
machine_role=production
vault secrets enable -path=ssh-${machine_role} ssh
vault write ssh-${machine_role}/config/ca generate_signing_key=true
vault write ssh-${machine_role}/roles/dev -<<"EOH"
{
  "allow_user_certificates": true,
  "allowed_users": "*",
  "default_extensions": [
    {
      "permit-pty": ""
    }
  ],
  "key_type": "ca",
  "default_user": "ubuntu",
  "ttl": "0m10s"
}
EOH
vault write ssh-${machine_role}/roles/root -<<"EOH"
{
  "allow_user_certificates": true,
  "allowed_users": "*",
  "default_extensions": [
    {
      "permit-pty": ""
    }
  ],
  "key_type": "ca",
  "default_user": "root",
  "ttl": "0m10s"
}
EOH