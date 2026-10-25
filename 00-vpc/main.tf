module "vpc" {
  #source      = "../Terraform-AWS-VPC"
  source = "git::https://github.com/Dchandra-devOps/Terraform-AWS-VPC.git?ref=main"
  project     = var.project
  environment = var.environment
   is_peering_required = false
}