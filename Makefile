build-ami:
	packer build -var 'aws_access_key=${AWS_ACCESS_KEY}' -var 'aws_secret_key=${AWS_SECRET_KEY}' -var 'aws_subnet_id=$(AWS_SUBNET_ID)' -var 'aws_ami=$(AWS_AMI)' -var 'aws_security_group_id=$(AWS_SECURITY_GROUP_ID)' packer.json

deploy-ami:
	ansible-playbook -i "localhost," -c local --extra-vars "ami=$(AMI)" deploy.yml
