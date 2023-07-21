#This resource will create Security Group for RDS Instance which will allow inbound traffic from desired EKS cluster.
resource "aws_security_group" "rds_instance_sg" {
  name              = "${var.identifier}-sg"
  description       = "Security group for access to the  RDS server"
  vpc_id            = var.vpc_id
  tags = {
    Name           = "${var.identifier}-sg"
    CostCenter     = var.costcenter
    environment    = var.environment
    service        = var.service
    TFRepo         = var.TFRepo
    Owner          = var.Owner
    TechnicalOwner = var.TechnicalOwner
  }

  ingress {
    description          = "Allow Traffic from Ngen Cluster Nodes"
    from_port            = var.port
    to_port              = var.port
    protocol             = "tcp"
    /* security_groups      = [var.cluster_node_sg] */
  }
  
  egress {
    description      = "Allow Outbound Traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
