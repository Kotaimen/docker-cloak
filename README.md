# How To...

Generate key pair & uid for bash

```bash

> docker run --rm -it --entrypoint ck-server cloak -key
Your PUBLIC key is:                      
psW1RiyVZDYmHbl4eTxC8H4QcLPoBbSz7onlt5w3SU0=
Your PRIVATE key is (keep it secret):    
MMcSIc2FOH6QRDQdbW8MNZMSmtZ5gcEGFJAWHUcDInw=

> docker run --rm -it --entrypoint ck-server cloak -uid
npq8NGKOU11idmqrq8A1MA==
```

## Sync to ECR

```shell

docker container run -i --rm \
  -e ECR_PASSWORD1=(aws --profile=bose_cn_networking ecr get-login-password --region cn-north-1) \
  -e ECR_PASSWORD2=(aws --profile=froststars ecr get-login-password --region cn-north-1) \
  -v "$(pwd)/regsync.yaml:/home/appuser/regsync.yaml" \
  ghcr.io/regclient/regsync:latest -c /home/appuser/regsync.yaml once

```
