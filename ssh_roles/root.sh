#!/bin/bash
machine_role=${1}
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
  "ttl": "5m0s"
}
EOH
