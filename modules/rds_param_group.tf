#This resource will create RDS parameter group for this RDS Instance.
/* resource "aws_db_parameter_group" "rds_instance_param_group" {
  name   = "${var.identifier}-param-group"
  family = var.family_version

  parameter {
    name  = ""
    value = ""
  }
  tags = {
    Name           = "${var.identifier}-param-group"
    CostCenter     = var.costcenter
    environment    = var.environment
    service        = var.service
    TFRepo         = var.TFRepo
    Owner          = var.Owner
    TechnicalOwner = var.TechnicalOwner
  }
} */

