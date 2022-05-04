resource "aws_iam_user" "s3_iam" {
  name = var.s3_name
}

resource "aws_iam_access_key" "s3_iam_accesskey" {
  user = aws_iam_user.s3_iam.name
}

resource "aws_iam_user_policy" "s3_policy" {
  name = "access-${aws_s3_bucket.s3_bucket.id}"
  user = "${aws_iam_user.s3_iam.name}"
  policy = <<EOF
{
    "Statement": [
        {
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation",
                "s3:ListBucketMultipartUploads",
                "s3:ListBucketVersions"
            ],
            "Effect": "Allow",
            "Resource": [
                "${aws_s3_bucket.s3_bucket.arn}"
            ]
        },
        {
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject",
                "s3:AbortMultipartUpload",
                "s3:ListMultipartUploadParts"
            ],
            "Effect": "Allow",
            "Resource": [
                "${aws_s3_bucket.s3_bucket.arn}/*"
            ]
        }
    ],
    "Version": "2012-10-17"
}

  EOF
}
