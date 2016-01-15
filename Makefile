build-ami:
	source vars.sh && packer build \
	-var 'hosts=all' \
	-var 'aws_access_key=${AWS_ACCESS_KEY}' \
	-var 'aws_secret_key=${AWS_SECRET_KEY}' \
	-var 'aws_source_ami=${BUILD_SOURCE_AMI}' \
	-var 'aws_subnet_id=${BUILD_SUBNET_ID}' \
	-var 'aws_security_group_id=${BUILD_SECURITY_GROUP}' \
	-var 'aws_region=${BUILD_REGION}' \
	-var 's3_bucket=${BUILD_S3_BUCKET}' \
	-var 's3_key=${BUILD_S3_KEY}' \
	packer.json

deploy-ami:
	source vars.sh && aws ec2 run-instances \
	--associate-public-ip-address \
	--image-id $(AMI) \
	--instance-type m3.medium \
	--count 3 \
	--iam-instance-profile "Name=S3andRDS_Full" \
	--key-name ${DEPLOY_KEY_NAME} \
	--security-group-ids ${DEPLOY_SG} \
	--subnet-id ${DEPLOY_SUBNET_ID} \
	--region ${DEPLOY_REGION}

provision:
	source vars.sh && ansible-playbook \
	--user ubuntu \
	--become-user root \
	--extra-vars "hosts=tag_Service_Zookeeper s3_bucket=${BUILD_S3_BUCKET} s3_key=${BUILD_S3_KEY}" \
	provision.yml
