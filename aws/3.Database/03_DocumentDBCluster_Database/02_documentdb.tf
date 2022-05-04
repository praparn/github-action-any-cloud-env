locals {
  timestamp = "${timestamp()}"
  timestamp_sanitized = "${replace("${local.timestamp}", "/[- TZ:]/", "")}"
}

resource "aws_docdb_cluster" "docdb_cluster" {
    cluster_identifier            = "${var.rds_prefixname}-docdb-cluster"
    engine                        = "docdb"
    engine_version                = var.rds_docdb_version
    master_username               = var.rds_username
    master_password               = var.rds_password
    backup_retention_period       = var.rds_retention_period
    preferred_backup_window       = var.rds_backup_window
    preferred_maintenance_window  = var.rds_maintenance_window
    db_subnet_group_name          = var.rds_subnet_name
    storage_encrypted             = var.rds_docdb_encrypt
    skip_final_snapshot           = var.rds_skip_final_snapshot
    final_snapshot_identifier     = "${var.rds_prefixname}-${local.timestamp_sanitized}-finalsnapshot"
    vpc_security_group_ids        = [aws_security_group.rds_secgroup.id]

    tags = {
      Name = "${var.rds_prefixname}-docdb-cluster"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
      Categories  = var.tag_category
      }
}

resource "aws_docdb_cluster_instance" "docdb_cluster_instance" {

    count                 = var.rds_replicas
    identifier            = "${var.rds_prefixname}-docdb-${count.index}"
    cluster_identifier    = aws_docdb_cluster.docdb_cluster.id
    instance_class        = var.rds_instance_type
    apply_immediately     = true
    tags = {
      Name = "${var.rds_prefixname}-docdb-${count.index}"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
      Categories  = var.tag_category
      }
    lifecycle {
        create_before_destroy = true
    }

}