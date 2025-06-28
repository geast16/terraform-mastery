removed {
  from = aws_s3_bucket.my_new_bucket
  lifecycle {
    destroy = false
  }

}
