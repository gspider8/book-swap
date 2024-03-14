#resource "aws_cognito_user_pool_domain" "main" {
#  domain       = "book-swap-domain"
#  user_pool_id = aws_cognito_user_pool.pool.id
#}


resource "aws_cognito_user_pool_client" "userpool_client" {
  name                                 = "book-swap"
  user_pool_id                         = aws_cognito_user_pool.pool.id
  callback_urls                        = ["https://${aws_cloudfront_distribution.distribution.domain_name}"]
  #allowed_oauth_flows_user_pool_client = true
  #allowed_oauth_flows                  = ["code", "implicit"]
  #allowed_oauth_scopes                 = ["email", "openid"]
  #supported_identity_providers         = ["COGNITO"]
}


resource "aws_cognito_user_pool" "pool" {
  name = "book-swap-pool"
}