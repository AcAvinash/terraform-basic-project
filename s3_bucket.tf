
resource "aws_s3_bucket" "mybucket" {
  bucket = "avinash799-test-bucket"
  tags = {
    Description = "Test bucket"
  }
}

resource "aws_s3_bucket_ownership_controls" "mybucket" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "mybucket" {
  depends_on = [aws_s3_bucket_ownership_controls.mybucket]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "mybucket" {
  bucket = aws_s3_bucket.mybucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
