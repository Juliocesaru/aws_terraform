# ACM Module - To create and Verify SSL Certificates
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  #version = "2.14.0"
  #version = "3.0.0"
  version = "5.0.0"

  subject_alternative_names = [
    "*.devopsincloud.com"
  ]
  tags = local.common_tags
  
  # Validation Method
  validation_method = "DNS"
  wait_for_validation = true  
}

# Output ACM Certificate ARN
output "this_acm_certificate_arn" {
  description = "The ARN of the certificate"
  #value       = module.acm.this_acm_certificate_arn
  value       = module.acm.acm_certificate_arn
}

