locals {
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
  redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
  public_subnet_ids = split(",",data.aws_ssm_parameter.public_subnet_ids.value)[0]
  ami_id = data.aws_ami.roboshop_ami.id
  common_name = "${var.project}-${var.environment}" 
  common_tags = {
   project = "${var.project}"
   environment = "${var.environment}"
   Terraform = "true"
  }
}