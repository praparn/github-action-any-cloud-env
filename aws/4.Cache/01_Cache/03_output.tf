output "aws_elasticache_cluster_endpoint" {
  value = "${aws_elasticache_cluster.elscache_redis.cache_nodes}"
}