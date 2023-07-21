module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "QA"
  }
}


module "GenAI_rds" {
    source = "./modules"

    # RDS Instance Values
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    license_model = var.license_model
    identifier = "${var.identifier}-${var.environment}"
    username = var.username
    storage_type = var.storage_type
    allocated_storage = var.allocated_storage
    max_allocated_storage = var.max_allocated_storage
    iops = var.iops
    multi_az = var.multi_az
    publicly_accessible = var.publicly_accessible
    port = var.port
    option_group_name = var.option_group_name
    backup_retention_period = var.backup_retention_period
    backup_window = var.backup_window
    storage_encrypted = var.storage_encrypted
    /* kms_key_id = var.kms_key_id */
    monitoring_interval = var.monitoring_interval
    allow_major_version_upgrade = var.allow_major_version_upgrade
    auto_minor_version_upgrade = var.auto_minor_version_upgrade
    apply_immediately = var.apply_immediately
    maintenance_window = var.maintenance_window
    skip_final_snapshot = var.skip_final_snapshot
    /* character_set_name = var.character_set_name */
    enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
    deletion_protection = var.deletion_protection
    delete_automated_backups = var.delete_automated_backups
    copy_tags_to_snapshot = var.copy_tags_to_snapshot
    iam_database_authentication_enabled = var.iam_database_authentication_enabled

    # tags
    costcenter = var.costcenter
    environment = var.environment
    service = var.service
    TFRepo = var.TFRepo
    Owner = var.Owner
    TechnicalOwner = var.TechnicalOwner

    # RDS Database Parameter Group Values
    family_version = var.family_version

    # RDS Database Security Group Values
    vpc_id = module.vpc.vpc_id
    /* cluster_node_sg = var.cluster_node_sg */

    # RDS Database Subnet Group Values
    subnet_ids = module.vpc.private_subnets
}