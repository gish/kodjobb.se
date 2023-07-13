resource "aws_s3_bucket" "website_bucket" {
  bucket = var.domain_name
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website_bucket.id
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket     = aws_s3_bucket.website_bucket.id
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.ownership]
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.website_bucket.id
  policy = data.aws_iam_policy_document.website_policy.json
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.website_bucket.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "index.html"
  source       = "./dist/index.html"
  content_type = "text/html"
  etag         = filemd5("./dist/index.html")
}

resource "aws_s3_object" "output_css" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "output.css"
  source       = "./dist/output.css"
  content_type = "text/css"
  etag         = filemd5("./dist/output.css")
}

resource "aws_s3_object" "output_png" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "designkod-og.png"
  source       = "./dist/designkod-og.png"
  content_type = "image/png"
  etag         = filemd5("./dist/designkod-og.png")
}
