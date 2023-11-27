# This module creates an ECS service and accompanying resources, like an ALB, Security Groups, etc.
# See https://github.com/pbs/terraform-aws-ecs-service-module/ for detailed documentation, examples, and more.

module "service" {
  source = "github.com/pbs/terraform-aws-ecs-service-module?ref=5.0.0"

  # Required
  hosted_zone = "food.pbs.org"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional
  image_repo = "wordpress"
  image_tag  = "latest"
}

# This module creates an RDS database and accompanying resources, like security groups.
# See https://github.com/pbs/terraform-aws-rds-module/ for detailed documentation, examples, and more.

module "rds" {
  source = "github.com/pbs/terraform-aws-rds-module?ref=0.3.26"

  private_hosted_zone = "private.internal"

  use_prefix = false

  # Just to make testing easier - in production these two values would be flipped.
  deletion_protection = false
  skip_final_snapshot = true

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}

# This module creates a "static website" S3 bucket and accompanying resources, like a CloudFront distribution, Route53 record, etc.
# See https://github.com/pbs/terraform-aws-static-website-module for detailed documentation, examples, and more.

module "static_website" {
  source = "github.com/pbs/terraform-aws-static-website-module?ref=6.0.15"

  primary_hosted_zone = "static."
  default_root_object = "index.html"

  # for ease of testing, would be false in production.
  force_destroy = true

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}