# Terraform CSR100v

Before we apply the changes, please accpet the terms with Azure CLI.

```
$ az vm image terms accept --urn cisco:cisco-csr-1000v:17_2_1-payg-sec:17.2.120200508
```

Create \*.tfvars file and prepare the username/password for SSH.

```
admin_username = "cisco"
admin_password = "cisco!234"
```

Terraform deployment.

```
$ terraform int
$ terraform plan
$ terraform apply
```
