
output "aws_instance_az1_private_dns" {
  value = {
    for instance in aws_instance.ec2_az1:
    instance.id => instance.private_dns
  }
}

output "aws_instance_az2_private_dns" {
  value = {
    for instance in aws_instance.ec2_az2:
    instance.id => instance.private_dns
  }
}

output "aws_instance_az3_private_dns" {
  value = {
    for instance in aws_instance.ec2_az3:
    instance.id => instance.private_dns
  }
}