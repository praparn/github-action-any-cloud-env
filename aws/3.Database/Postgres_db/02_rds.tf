locals {
  timestamp = "${timestamp()}"
  timestamp_sanitized = "${replace("${local.timestamp}", "/[- TZ:]/", "")}"
}

resource "aws_db_instance" "rds" {
  identifier                = "${var.rds_prefixname}-${var.rds_engine}-rds"
  allocated_storage         = var.rds_size
  engine                    = var.rds_engine
  engine_version            = lookup(var.rds_version, var.rds_engine)
  instance_class            = var.rds_instance_type
  username                  = var.rds_username
  password                  = var.rds_password
  db_subnet_group_name      = var.rds_subnet_name
  backup_retention_period   = var.rds_retention_period
  backup_window             = var.rds_backup_window
  maintenance_window        = var.rds_maintenance_window
  vpc_security_group_ids    = [aws_security_group.rds_secgroup.id]
  skip_final_snapshot       = var.rds_skip_final_snapshot
  final_snapshot_identifier = "${var.rds_prefixname}-${local.timestamp_sanitized}-finalsnapshot"
  tags = {
      Name = "${var.rds_prefixname}-${var.rds_engine}-rds"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
      Categories  = var.tag_category
      }
}