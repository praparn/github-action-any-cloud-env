output "rds_address" {
    value = "${aws_docdb_cluster.docdb_cluster.endpoint}"
}