# zookeeper-ansible

An ansible playbook for deploying a Zookeeper cluster to AWS. Typical workflow
is to create an Amazon AMI using packer and ansible and then deploy that AMI using
ansible.

## Start

Edit vars.yml.example with your settings and place at vars.yml.

## Build an AMI

To build an AMI for running on Amazon EC2 using packer.

```bash
make build-ami
```

## Deploy an AMI

To deploy a built AMI to EC2, edit vars.yml with your new AMI build by Packer
and deploy.

```bash
make deploy-ami
```

## Local Testing

You can test the provisioning workflow using Vagrant:

```bash
vagrant up
```
