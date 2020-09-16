# Terraform CSR100v

Before we apply the changes, please accpet the terms with Azure CLI(Because we are using the image from marketplace which provided by Cisco).

```
$ az vm image terms accept --urn cisco:cisco-csr-1000v:17_2_1-payg-sec:17.2.120200508
```

You can use other version if you want (you can find the Urn value, and also please update related value in `main.tf`)

```
$ az vm image list --all -l westeurope  -p cisco -f cisco-csr-1000v -o table
Offer            Publisher    Sku              Urn                                                   Version
---------------  -----------  ---------------  ----------------------------------------------------  ---------------
cisco-csr-1000v  cisco        16_10-byol       cisco:cisco-csr-1000v:16_10-byol:16.10.120190108      16.10.120190108
cisco-csr-1000v  cisco        16_10-byol       cisco:cisco-csr-1000v:16_10-byol:16.10.220190622      16.10.220190622
cisco-csr-1000v  cisco        16_10-payg-ax    cisco:cisco-csr-1000v:16_10-payg-ax:16.10.120190108   16.10.120190108
cisco-csr-1000v  cisco        16_10-payg-ax    cisco:cisco-csr-1000v:16_10-payg-ax:16.10.220190622   16.10.220190622
cisco-csr-1000v  cisco        16_10-payg-sec   cisco:cisco-csr-1000v:16_10-payg-sec:16.10.120190108  16.10.120190108
cisco-csr-1000v  cisco        16_10-payg-sec   cisco:cisco-csr-1000v:16_10-payg-sec:16.10.220190622  16.10.220190622
cisco-csr-1000v  cisco        16_12-byol       cisco:cisco-csr-1000v:16_12-byol:16.12.120190816      16.12.120190816
cisco-csr-1000v  cisco        16_12-payg-ax    cisco:cisco-csr-1000v:16_12-payg-ax:16.12.120190816   16.12.120190816
cisco-csr-1000v  cisco        16_12-payg-sec   cisco:cisco-csr-1000v:16_12-payg-sec:16.12.120190816  16.12.120190816
cisco-csr-1000v  cisco        16_6             cisco:cisco-csr-1000v:16_6:16.6.120170804             16.6.120170804
cisco-csr-1000v  cisco        16_6             cisco:cisco-csr-1000v:16_6:16.6.220171219             16.6.220171219
cisco-csr-1000v  cisco        16_7             cisco:cisco-csr-1000v:16_7:16.7.120171201             16.7.120171201
cisco-csr-1000v  cisco        16_9-byol        cisco:cisco-csr-1000v:16_9-byol:16.9.120180924        16.9.120180924
cisco-csr-1000v  cisco        16_9-byol        cisco:cisco-csr-1000v:16_9-byol:16.9.220181121        16.9.220181121
cisco-csr-1000v  cisco        16_9-byol        cisco:cisco-csr-1000v:16_9-byol:16.9.320190501        16.9.320190501
cisco-csr-1000v  cisco        17_1-byol        cisco:cisco-csr-1000v:17_1-byol:17.1.20200315         17.1.20200315
cisco-csr-1000v  cisco        17_1-payg-ax     cisco:cisco-csr-1000v:17_1-payg-ax:17.1.20200319      17.1.20200319
cisco-csr-1000v  cisco        17_1-payg-sec    cisco:cisco-csr-1000v:17_1-payg-sec:17.1.20200319     17.1.20200319
cisco-csr-1000v  cisco        17_2_1-byol      cisco:cisco-csr-1000v:17_2_1-byol:17.2.120200508      17.2.120200508
cisco-csr-1000v  cisco        17_2_1-payg-ax   cisco:cisco-csr-1000v:17_2_1-payg-ax:17.2.120200508   17.2.120200508
cisco-csr-1000v  cisco        17_2_1-payg-sec  cisco:cisco-csr-1000v:17_2_1-payg-sec:17.2.120200508  17.2.120200508
```

Create \*.tfvars file and prepare the username/password for SSH.

```
admin_username = "cisco"
admin_password = "cisco!234"
```

Terraform deployment.

```
$ terraform init
$ terraform plan
$ terraform apply
```

After few minutes, you can find the CSR1000v host public IP from the state file(`terraform.tfstate`) created by Terraform.

use the pusername/password you created to login the router

```
$ ssh cisco@xx.xx.xx.xx
The authenticity of host 'xx.xx.xx.xx (xx.xx.xx.xx)' can't be established.
RSA key fingerprint is SHA256:Tq7oxbz9cdddAAlWdeGGURUeukw5mjpeaodlc/5iFhQI.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'xx.xx.xx.xx' (RSA) to the list of known hosts.
Password:



csr1000v-r1#show vers
csr1000v-r1#show version
Cisco IOS XE Software, Version 17.02.01r
Cisco IOS Software [Amsterdam], Virtual XE Software (X86_64_LINUX_IOSD-UNIVERSALK9-M), Version 17.2.1r, RELEASE SOFTWARE (fc2)
Technical Support: http://www.cisco.com/techsupport
Copyright (c) 1986-2020 by Cisco Systems, Inc.
Compiled Thu 09-Apr-20 23:22 by mcpre


Cisco IOS-XE software, Copyright (c) 2005-2020 by cisco Systems, Inc.
All rights reserved.  Certain components of Cisco IOS-XE software are
licensed under the GNU General Public License ("GPL") Version 2.0.  The
software code licensed under GPL Version 2.0 is free software that comes
with ABSOLUTELY NO WARRANTY.  You can redistribute and/or modify such
GPL code under the terms of GPL Version 2.0.  For more details, see the
documentation or "License Notice" file accompanying the IOS-XE software,
or the applicable URL provided on the flyer accompanying the IOS-XE
software.


ROM: IOS-XE ROMMON

csr1000v-r1 uptime is 2 minutes
Uptime for this control processor is 9 minutes
System returned to ROM by reload
System image file is "bootflash:packages.conf"
Last reload reason: Unknown reason
```


## Destroy

for saving money

```
$ terraform destroy --auto-approve
```
