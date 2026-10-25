locals {
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
  redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
  rabbitmq_sg_id = data.aws_ssm_parameter.rabitmq_sg_id.value
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
  database_subnet_ids = split(",",data.aws_ssm_parameter.database_subnet_ids.value)[0]
  ami_id = data.aws_ami.roboshop_ami.id
  common_name = "${var.project}-${var.environment}" 
  common_tags = {
   project = "${var.project}"
   environment = "${var.environment}"
   Terraform = "true"
  }
}