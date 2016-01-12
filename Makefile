build-ami:
	packer build \
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
	aws ec2 run-instances \
	--image-id ${DEPLOY_AMI} \
	--count 1 \
	--instance-type t2.micro \
	--iam-instance-profile "Name=S3-Full" \
	--key-name ${DEPLOY_KEY_NAME} \
	--security-group-ids ${DEPLOY_SG} \
	--subnet-id ${DEPLOY_SUBNET_ID} \
	--region ${DEPLOY_REGION}
