module "aws_sg" {
  source = "../../terraform-aws-sg"
  count = length(var.sg_names)
  vpc_id = local.vpc_id
  project = var.project
  environment = var.environment
  sg_name =replace(var.sg_names[count.index], "_", "-")
}

