locals {
  backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  private_subnet_ids = split(",",data.aws_ssm_parameter. private_subnet_ids.value)
  ami_id = data.aws_ami.roboshop_ami.id
  common_name = "${var.project}-${var.environment}" 
  common_tags = {
   project = "${var.project}"
   environment = "${var.environment}"
   Terraform = "true"
  }
}