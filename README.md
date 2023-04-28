# Terraform -- Build Apache Webserver

Overview

Using Provisioner uses [terraform] to create an apache virtual machines on [AWS Cloud]. The [terraform] job expects variables set as environment variables or in a terraform.tfvars file.

NOTE: Terraform must be version 0.12 or greater.

-----

# Getting Started

As new guides cross my path to assist in my knowledge and understanding of how the AWS Provider works and the best practices to build infrastructure using Terraform. I will update this repository as new tutorials become available for me to learn and use to gain more knowledge. The ***Guides*** portion of this README will be updated accordingly with links used to learn. This is done for future referencing and of course to give credit to the original owner.

---
## Guides
- [Learn Ubuntu Apache2](https://www.howtoforge.com/how-to-configure-apache-virtual-hosts-on-ubuntu-using-terraform/)
- [Learn Ubuntu Apache2](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-22-04)
- [Learn HTML Setup](https://opensource.com/article/18/2/apache-web-server-configuration)
- [Learn Ceate new infrastructer in existing](https://stackoverflow.com/questions/47665428/how-to-launch-ecs-in-an-existing-vpc-using-terraform)
---

# Connection

### SSH Commands:
#### Generate SSH Key Pair:
```bash
$ ssh-keygen
```

#### EC2 Connect
```bash
$ chmod 400 <'nameOfKeyPair'>.pem
$ ssh -i "<'nameOfKeyPair'>.pem" <'user-name'>@<'instance-public-domain'>
```
----



## Deployment

Run the following to ensure ***terraform*** will only perform the expected
actions:

```bash
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
```

## Tearing Down the Terraform Infrastructure

Run the following to verify that ***terraform*** will only impact the expected
nodes and then tear down the cluster.

```sh
terraform plan
terraform destroy
```

-------



---
[tfhome](https://www.terraform.io)
[tfdocs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
[medium](https://medium.com/)