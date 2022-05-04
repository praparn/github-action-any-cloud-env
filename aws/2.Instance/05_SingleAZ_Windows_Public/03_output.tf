output "aws_instance_publicdns" {
  value = {
    for instance in aws_instance.ec2:
    instance.id => instance.public_dns
  }
}