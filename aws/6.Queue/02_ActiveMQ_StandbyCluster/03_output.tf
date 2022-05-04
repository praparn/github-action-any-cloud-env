output "rabbitmq_arn" {
    value = "${aws_mq_broker.queue.arn}"
}

output "rabbitmq_id" {
    value = "${aws_mq_broker.queue.id}"
}

output "rabbitmq_url" {
    value = "${aws_mq_broker.queue.instances}"
}