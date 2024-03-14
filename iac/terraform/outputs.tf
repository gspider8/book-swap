output "website_url" {
  description = "Website URL (HTTPS)"
  value       = aws_cloudfront_distribution.distribution.domain_name
}

output "s3_url" {
  description = "S3 hosting URL (HTTP)"
  value       = aws_s3_bucket_website_configuration.hosting.website_endpoint
}

output "user_pool_id" {
    description = "User Poool ID for js file"
    value = aws_cognito_user_pool.pool.id
}

output "cognito_client_id" {
    description = "Client ID for js file"
    value = aws_cognito_user_pool_client.userpool_client.id
}