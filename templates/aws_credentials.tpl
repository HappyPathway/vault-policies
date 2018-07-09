{{ $path := env "aws_role" }}
{{ with secret (printf "aws/creds/%s" $path ) }}
[default]
AWS_SECRET_ACCESS_KEY={{ .Data.secret_key }}
AWS_ACCESS_KEY_ID={{ .Data.access_key }}
{{ end }}