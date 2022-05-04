resource "aws_iam_policy" "iampolicy_ec2" {
  name        = var.iampolicy_ec2
  path        = "/"
  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [{
      "Effect": "Allow",
      "Action": [
         "ec2:DescribeInstances", 
         "ec2:DescribeImages",
         "ec2:DescribeTags", 
         "ec2:DescribeSnapshots"
      ],
      "Resource": "*"
   }
   ]
}
EOF
}

resource "aws_iam_role" "iamrole_ec2" {
  name = var.iamrole_ec2
  path = "/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "iaminstanceprofile_ec2" {
  name = var.iaminstanceprofile_ec2
  role = aws_iam_role.iamrole_ec2.name
}

resource "aws_iam_policy_attachment" "iampolicyattach_ec2" {
  name       = "iampolicyattach_ec2"
  roles      = [aws_iam_role.iamrole_ec2.name]
  policy_arn = aws_iam_policy.iampolicy_ec2.id
}

