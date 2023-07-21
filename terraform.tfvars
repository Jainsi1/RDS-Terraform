# variable declaration for RDS DB instance
engine = "postgres"
engine_version = "15.3"
instance_class = "db.m7g.large"
license_model = "postgresql-license"
identifier = "test"
username = "genaiadmin"
storage_type = "gp3"
allocated_storage = "20"
max_allocated_storage = "100"
iops = "0"
multi_az = true
publicly_accessible = false
port = "5432"
option_group_name = null
backup_retention_period = "10"
backup_window = "03:00-06:00"
storage_encrypted = true
/* kms_key_id =  */
monitoring_interval = "0" 
allow_major_version_upgrade = false
auto_minor_version_upgrade = true
apply_immediately = true
maintenance_window = "Sun:00:00-Sun:03:00"
skip_final_snapshot = true
/* character_set_name =  "SQL_Latin1_General_CP1_CI_AS" */
enabled_cloudwatch_logs_exports = ["postgresql"]
deletion_protection = false
delete_automated_backups = true
copy_tags_to_snapshot =  true
iam_database_authentication_enabled = false

# variable declaration for tags 
costcenter = "15250-10"
environment = "QA"
service = "GenAI"
TFRepo = "not known"
Owner = "Neer Hershtig"
TechnicalOwner = "David Lozzi"

