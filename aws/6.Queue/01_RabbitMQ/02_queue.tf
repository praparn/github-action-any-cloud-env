resource "aws_mq_broker" "queue" {
  broker_name = "${var.queue_prefixname}-${var.queue_engtype}-queue"
  host_instance_type = var.queue_instance_type
  subnet_ids         = [ var.subnet_private_1a ]
  deployment_mode    = var.queue_deploymentmode
  engine_type        = var.queue_engtype
  engine_version     = lookup(var.queue_engversion, var.queue_engtype)
  storage_type       = "ebs"
  security_groups    = [aws_security_group.queue.id]
  publicly_accessible = var.queue_publiclyaccessible
  apply_immediately  = true
  user {
    username = var.queue_username
    password = var.queue_password
  }
  tags = {
      Name        = "${var.queue_prefixname}-${var.queue_engtype}-queue"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
      Categories  = var.tag_category
      }
}