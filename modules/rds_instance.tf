# This resource will create a random password for your database
resource "random_password" "password" {
  length           = 8
  special          = false
}


resource "aws_secretsmanager_secret" "my_secret" {
  name        = "my-gfdfhn"
  description = "My secret"
  recovery_window_in_days =  "0"
}

resource "aws_secretsmanager_secret_version" "my_secret_version" {
  secret_id     = aws_secretsmanager_secret.my_secret.id
  secret_string = jsonencode({
    "password": "${random_password.password.result}",
    "username": "${aws_db_instance.rds_instance.username}"
  })
}

#This resource will create RDS Instance.
resource "aws_db_instance" "rds_instance" {
    depends_on = [
    aws_security_group.rds_instance_sg, 
    aws_db_subnet_group.rds_instance_subnet_group, 
  ]
  engine                            = var.engine
  engine_version                    = var.engine_version
  license_model                     = var.license_model
  
  identifier                        = "twst"
  username                          = var.username
  password                          = random_password.password.result

  instance_class                    = var.instance_class
  storage_type                      = var.storage_type
  allocated_storage                 = var.allocated_storage
  max_allocated_storage             = var.max_allocated_storage
 
  multi_az                          = var.multi_az
  #availability_zone                = var.availability_zone

  db_subnet_group_name              = aws_db_subnet_group.rds_instance_subnet_group.id
  publicly_accessible               = var.publicly_accessible
  vpc_security_group_ids            = [aws_security_group.rds_instance_sg.id]
  port                              = var.port 

  /* parameter_group_name              = aws_db_parameter_group.rds_instance_param_group.name */
  option_group_name                 = var.option_group_name

  backup_retention_period           = var.backup_retention_period
  backup_window                     = var.backup_window
  storage_encrypted                 = var.storage_encrypted
  /* kms_key_id                        = var.kms_key_id */

  monitoring_interval               = var.monitoring_interval

  allow_major_version_upgrade       = var.allow_major_version_upgrade
  auto_minor_version_upgrade        = var.auto_minor_version_upgrade
  apply_immediately                 = var.apply_immediately
  maintenance_window                = var.maintenance_window

  skip_final_snapshot               = var.skip_final_snapshot

  /* character_set_name                = var.character_set_name */
  enabled_cloudwatch_logs_exports   = var.enabled_cloudwatch_logs_exports
  deletion_protection               = var.deletion_protection
  delete_automated_backups          = var.delete_automated_backups
  copy_tags_to_snapshot             = var.copy_tags_to_snapshot

  iam_database_authentication_enabled    = var.iam_database_authentication_enabled
  #performance_insights_enabled          = var.performance_insights_enabled
  #performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : 0
  #performance_insights_kms_key_id       = var.performance_insights_enabled ? var.performance_insights_kms_key_id : ''

  tags = {
    Name           = var.identifier
    CostCenter     = var.costcenter
    environment    = var.environment
    service        = var.service
    TFRepo         = var.TFRepo
    Owner          = var.Owner
    TechnicalOwner = var.TechnicalOwner
  }
  iops = var.storage_type == "io1" || (var.storage_type == "gp3" && var.allocated_storage >= 400) ? var.iops : null
}




