resource "aws_mq_broker" "queue" {
  broker_name = "${var.queue_prefixname}-${var.queue_engtype}-queue"
  host_instance_type = var.queue_instance_type
  subnet_ids         = [ var.subnet_private_1b ]
  deployment_mode    = var.queue_deploymentmode
  engine_type        = var.queue_engtype
  engine_version     = lookup(var.queue_engversion, var.queue_engtype)
  storage_type       = var.queue_storage_type
  security_groups    = [aws_security_group.queue.id]
  publicly_accessible = var.queue_publiclyaccessible
  apply_immediately  = true
  user {
    username = var.queue_username
    password = var.queue_password
  }
  configuration {
    id       = aws_mq_configuration.queue.id
    revision = aws_mq_configuration.queue.latest_revision
  }
  tags = {
      Name        = "${var.queue_prefixname}-${var.queue_engtype}-queue"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
      Categories  = var.tag_category
      }
}

resource "aws_mq_configuration" "queue" {
  name           = "${var.queue_prefixname}-${var.queue_engtype}-queueconf"
  engine_type    = var.queue_engtype
  engine_version = lookup(var.queue_engversion, var.queue_engtype)

  data = <<DATA
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<broker xmlns="http://activemq.apache.org/schema/core">
  <plugins>
    <forcePersistencyModeBrokerPlugin persistenceFlag="true"/>
    <statisticsBrokerPlugin/>
    <timeStampingBrokerPlugin ttlCeiling="86400000" zeroExpirationOverride="86400000"/>
  </plugins>
</broker>
DATA
}