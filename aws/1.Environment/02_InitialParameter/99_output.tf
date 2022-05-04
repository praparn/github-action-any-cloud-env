############################################################################################################
# Output Variable Configuration                                                                            #
############################################################################################################

output "iampolicy_ec2" {
  value = aws_iam_policy.iampolicy_ec2.name
}

output "iamrole_ec2" {
  value = aws_iam_role.iamrole_ec2.name
}

output "iaminstanceprofile_ec2" {
  value = aws_iam_instance_profile.iaminstanceprofile_ec2.id
}