locals {
  timestamp = "${timestamp()}"
  timestamp_sanitized = "${replace("${local.timestamp}", "/[- TZ:]/", "")}"
}

resource "aws_rds_cluster" "aurora_cluster" {
    cluster_identifier            = "${var.rds_prefixname}-cluster"
    database_name                 = var.rds_prefixname
    master_username               = var.rds_username
    master_password               = var.rds_password
    backup_retention_period       = var.rds_retention_period
    preferred_backup_window       = var.rds_backup_window
    preferred_maintenance_window  = var.rds_maintenance_window
    db_subnet_group_name          = var.rds_subnet_name
    storage_encrypted             = var.rds_aurora_encrypt
    skip_final_snapshot           = var.rds_skip_final_snapshot
    final_snapshot_identifier     = "${var.rds_prefixname}-${local.timestamp_sanitized}-finalsnapshot"
    vpc_security_group_ids        = [aws_security_group.rds_secgroup.id]

  tags = {
      Name = "${var.rds_prefixname}-cluster"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
      Categories  = var.tag_category
      }
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_rds_cluster_instance" "aurora_cluster_instance" {
    count                 = var.rds_replicas
    identifier            = "${var.rds_prefixname}-${count.index}"
    cluster_identifier    = aws_rds_cluster.aurora_cluster.id
    instance_class        = var.rds_instance_type
    db_subnet_group_name  = var.rds_subnet_name
    publicly_accessible   = var.rds_public_access

  tags = {
      Name = "${var.rds_prefixname}-${count.index}"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
      Categories  = var.tag_category
  }
    lifecycle {
        create_before_destroy = true
    }

}
