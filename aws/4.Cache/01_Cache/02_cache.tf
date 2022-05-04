
resource "aws_elasticache_cluster" "elscache_redis" {
  cluster_id           = "${var.elscache_prefixname}-${var.elscache_engine}-cache"
  engine               = var.elscache_engine
  engine_version       = lookup(var.elscache_version, var.elscache_engine)
  node_type            = var.elscache_instance_type
  maintenance_window   = var.elscache_window
  num_cache_nodes      = var.elscache_replicas
  security_group_ids   = [aws_security_group.cache.id]
  subnet_group_name    = var.cache_subnet_name
  apply_immediately    = true
  parameter_group_name = lookup(var.elscache_parameter, var.elscache_engine)
    tags = {
      Name = "${var.elscache_prefixname}-${var.elscache_engine}-cache"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
      Categories  = var.tag_category
      }
}