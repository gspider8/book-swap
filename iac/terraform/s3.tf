resource "aws_s3_bucket" "book-swap-bucket" {
  tags = {
    project = var.project
  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.book-swap-bucket.id
  key    = "index.html"
  source = "../../frontend/index.html"

  # terraform cannot tell when object has changed.. unless you use the etag
  # etag = filemd5("path/to/file")
  etag = filemd5("../../frontend/index.html")
  
}