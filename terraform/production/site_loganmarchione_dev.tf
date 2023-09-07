module "static_site_loganmarchione_dev" {
  source = "github.com/loganmarchione/terraform-aws-static-site?ref=0.0.2"

  custom_default_tags = {
    Environment = "Production"
  }

  # The apex name of the site and the name of the S3 bucket to store the static files
  site_name   = "loganmarchione.dev"
  bucket_name = "loganmarchione-dev"

  # Since this is a static site, we probably don't need versioning, since our source files are stored in git
  bucket_versioning_logs = "Disabled"
  bucket_versioning_site = "Disabled"

  # CloudFront settings
  cloudfront_default_root_object          = "index.html"
  cloudfront_enabled                      = true
  cloudfront_http_version                 = "http2and3"
  cloudfront_ipv6                         = true
  cloudfront_price_class                  = "PriceClass_100"
  cloudfront_ssl_minimum_protocol_version = "TLSv1.2_2021"

  # Upload a test page
  test_page = true
}
