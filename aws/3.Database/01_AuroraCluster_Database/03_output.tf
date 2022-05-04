output "rds_address" {
    value = "${aws_rds_cluster.aurora_cluster.endpoint}"
}