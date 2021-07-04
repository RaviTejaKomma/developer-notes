## Terraform:

Terraform is a tool and has become more popular because it has a simple syntax that allows easy modularity and works against multi-cloud. One important reason people consider Terraform is to manage their infrastructure as code.
### Installation guide:

Terraform is distributed as a tarball on Github. Check the latest release on [Terraform releases](https://github.com/hashicorp/terraform/releases) page before downloading below.

```bash
sudo yum install -y zip unzip (if these are not installed)
wget https://releases.hashicorp.com/terraform/0.X.X/terraform_0.X.X_linux_amd64.zip (replace x with your version)
unzip terraform_0.11.6_linux_amd64.zip
sudo mv terraform /usr/local/bin/
```
Confirm terraform binary is accessible: terraform —version

Make sure Terraform works:
```bash
terraform -v
Terraform v0.11.6
```

### Commands:
1) init
3) plan => Real world <-> Designed config
4) apply => Plam <-> Real world
5) destroy => Plan <-> Real world

### Important Links:

- google_compute_instance: 
https://www.terraform.io/docs/providers/google/r/compute_instance.html

- google_compute_instance_template:
https://www.terraform.io/docs/providers/google/r/compute_instance_template.html

- google_compute_attached_disk:
https://www.terraform.io/docs/providers/google/r/compute_attached_disk.html

### Refernces:
- https://computingforgeeks.com/how-to-install-terraform-on-linux/