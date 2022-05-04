############################################################################################################
# Output Variable Configuration                                                                            #
############################################################################################################

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "route53_zoneid" {
  value = "${aws_route53_zone.route53.zone_id}"
}

output "subnet_public_1a" {
  value = "${aws_subnet.subnet_public_1a.id}"
}

output "subnet_private_1a" {
  value = "${aws_subnet.subnet_private_1a.id}"
}

output "subnet_public_1b" {
  value = "${aws_subnet.subnet_public_1b.id}"
}

output "subnet_private_1b" {
  value = "${aws_subnet.subnet_private_1b.id}"
}

output "subnet_public_1c" {
  value = "${aws_subnet.subnet_public_1c.id}"
}

output "subnet_private_1c" {
  value = "${aws_subnet.subnet_private_1c.id}"
}

output "rds_subnet_name" {
  value = aws_db_subnet_group.rds_subnet_group.name
}

output "cache_subnet_name" {
  value = aws_elasticache_subnet_group.elscache_redis_subnet.name
}