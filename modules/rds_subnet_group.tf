#This resource will create Subnet group which will be associated with RDS Instance.
resource "aws_db_subnet_group" "rds_instance_subnet_group" {

  name              = "test-subnet-group"
  description       = "Subnet Group for ${var.identifier}"
  subnet_ids        = var.subnet_ids
  tags = {
    Name           = "${var.identifier}-subnet-group"
    CostCenter     = var.costcenter
    environment    = var.environment
    service        = var.service
    TFRepo         = var.TFRepo
    Owner          = var.Owner
    TechnicalOwner = var.TechnicalOwner
  }
}



