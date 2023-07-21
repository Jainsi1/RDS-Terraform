#Variable for AWS Seceret manager
variable "masterdbdetails" {
  description = "AWS Secret name for database credential."
  type        = string
  default     = ""
}

#Variables for RDS Instance
variable "engine" {
  description = "The database engine to use."
  type        = string
  default     = ""
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = ""
}

variable "license_model" {
  description = "License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1"
  type        = string
  default     = "license-included"
}

variable "identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  type        = string
  default     = ""
}

/* variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  default     = ""
  type        = string
} */

variable "username" {
  description = "Username for the master DB user"
  default     = ""
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  default     = ""
  type        = string
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  default     = "gp2"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  default     = "0"
  type        = number
}

variable "max_allocated_storage" {
  description = "Specifies the value for Storage Autoscaling"
  default     = "0"
  type        = number
}

variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  default     = "0"
  type        = number
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  default     = true
  type        = string
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  default     = false
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list
  default     = []
}

variable "port" {
  description = "The port on which the DB accepts connections"
  default     = "1433"
  type        = number
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  default     = ""
  type        = string
}

variable "option_group_name" {
  description = "Name of the DB option group to associate."
  default     = ""
  type        = string
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  default     = "5"
  type        = number
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  default     = ""
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  default     = true
}

/* variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used"
  default     = ""
} */

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  default     = true
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  default     = 0
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  default     = false
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  default     = ""
}

/* variable "character_set_name" {
  description = "(Optional) The character set name to use for DB encoding in Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS and Collations and Character Sets for Microsoft SQL Server for more information. This can only be set on creation."
  default     = ""
} */

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)."
  default     = []
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  default     = false
}

variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  default     = true
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  default     = false
}

variable "copy_tags_to_snapshot" {
  description = "On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)"
  default     = true
}

variable "timezone" {
  description = "(Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information."
  default     = "GMT Standard Time"
}

#Variable for Subnet group of RDS Instance

variable "subnet_ids"{
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  type        = list(string)
  default     = []
}

#Variable for Security group of RDS Instance

variable "vpc_id" {
  description = "ID of the VPC."
  type        = string
  default     = "vpc-0afe7f0e55e9c84eb"
}

variable "cluster_node_sg"{
  default = ""
}

#Varibles for Parameter group
variable "family_version" {
   description = "Family version for DB Parameter Group"
   default =    "sqlserver-se-14.0"
}

#Variable declaration for Tags
variable "costcenter" {
  description = "Cost Center tag for billing."
  type        = string
}

variable "environment" {
  description = "A name to describe the environment we're creating."
  type        = string
}

variable "service" {
  description = "Service name for which S3 bucket is being created."
  type        = string
}

variable "TFRepo" {
  description = "Terraform Repository path where the TF code is located."
  type        = string
}

variable "Owner" {
  description = "Owner of the Service."
  type        = string
}

variable "TechnicalOwner" {
  description = "Technical Owner of the Service."
  type        = string
}