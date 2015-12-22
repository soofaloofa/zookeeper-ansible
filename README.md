# zookeeper-ansible

An ansible playbook for deploying a Zookeeper cluster to AWS.

## Start

Edit vars.yml.example with your settings and place at vars.yml.

## Local Vagrant VM

To create a local virtual machine running Zookeeper, run:

```bash
vagrant up
```

## Build an AMI

To build an AMI for running on Amazon EC2 using packer.

```bash
make build-ami
```

## Deploy an AMI

To deploy a built AMI to EC2.

```bash
make deploy-ami
```
