# SSH KeyManagement
## Show Hosts Public Key
```bash
vault read ssh-dev/config/ca
```

## sign key
```bash
vault write -field=signed_key ssh-dev/sign/dev public_key=@${HOME}/.ssh/id_rsa.pub
```

# AWS/Ec2 Credentials
## read ec2 dev credentials
```bash
vault read aws/creds/ec2_dev
```

## read ec2 admin credentials
```bash
vault read aws/creds/ec2_admin
```
