resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "book-swap-frontend-bucket"

  tags = {
    project = var.proj
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.frontend_bucket.id
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "PublicReadGetObject",
          "Effect" : "Allow",
          "Principal" : "*",
          "Action" : "s3:GetObject",
          "Resource" : "arn:aws:s3:::${aws_s3_bucket.frontend_bucket.id}/*"
        }
      ]
    }
  )
}

#resource "aws_s3_bucket_public_access_block" "frontend_bucket_public_access" {
#  bucket = aws_s3_bucket.frontend_bucket.id
#  block_public_acls       = false
#  block_public_policy     = false
#  ignore_public_acls      = false
#  restrict_public_buckets = false
#}


resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.frontend_bucket.id

  index_document {
    suffix = "index.html"
  }

  #error_document {
  #  key = "error.html"
  #}

}

resource "aws_s3_object" "object" {
  for_each     = fileset(path.module, "frontend/**/*.{html,css,js}")
  bucket       = aws_s3_bucket.frontend_bucket.id
  key          = replace(each.value, "/^frontend//", "")
  source       = each.value
  content_type = lookup(local.content_types, regex("\\.[^.]+$", each.value), null)
  etag         = filemd5(each.value)

  #bucket = aws_s3_bucket.frontend_bucket.id
  #key    = "index.html"
  #source = "../../frontend/index.html"
  #etag = filemd5("../../frontend/index.html")
  
}