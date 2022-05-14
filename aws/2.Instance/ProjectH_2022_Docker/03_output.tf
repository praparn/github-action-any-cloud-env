output "aws_instance_public_dns" {
  value = {
    for instance in aws_instance.ec2:
    instance.id => instance.public_dns
  }
}