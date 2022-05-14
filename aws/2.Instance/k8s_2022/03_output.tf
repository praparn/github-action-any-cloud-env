
output "aws_instance_az1_public_dns" {
  value = {
    for instance in aws_instance.ec2_az1:
    instance.id => instance.public_dns
  }
}

output "aws_instance_az2_public_dns" {
  value = {
    for instance in aws_instance.ec2_az2:
    instance.id => instance.public_dns
  }
}

output "aws_instance_az3_public_dns" {
  value = {
    for instance in aws_instance.ec2_az3:
    instance.id => instance.public_dns
  }
}