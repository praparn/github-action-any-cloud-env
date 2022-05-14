output "s3_id" {
    value = "${aws_s3_bucket.s3_bucket.id}"
}
output "s3_arn" {
    value = "${aws_s3_bucket.s3_bucket.arn}"
}
output "s3_domainname" {
    value = "${aws_s3_bucket.s3_bucket.bucket_domain_name}"
}
output "s3_region" {
    value = "${aws_s3_bucket.s3_bucket.region}"
}

output "iam_s3_name" {
  value = aws_iam_user.s3_iam.name
}

output "iam_s3_accesskey" {
  value = aws_iam_access_key.s3_iam_accesskey.id
}

output "iam_s3_secretkey" {
  value = aws_iam_access_key.s3_iam_accesskey.secret
  sensitive = true
}