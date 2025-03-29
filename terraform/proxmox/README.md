# Proxmox terraform blueprint

In order to use it properly first secrets.env file (or just env variables) need to be set.
```bash
export PM_API_URL=""
export PM_API_TOKEN_ID=""
export PM_API_TOKEN_SECRET=""
```

Next based on variables.tf file variables.tfvars might be created to define all the necessary variables.

In the end in cloud-init.tpl /etc/hosts can be passed - useful for kubernetes nodes creation.