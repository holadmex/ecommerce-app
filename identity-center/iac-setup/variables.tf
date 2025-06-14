# variables.tf - Variable definitions
variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "organization_name" {
  description = "Organization name for account naming"
  type        = string
  default     = "MyCompany"
}

variable "devops_users" {
  description = "DevOps team users"
  type = map(object({
    username    = string
    email       = string
    given_name  = string
    family_name = string
  }))
  default = {
    "example_a" = {
      username    = "example.a"
      email       = "example.a@company.com"
      given_name  = "Example"
      family_name = "A"
    }
    "example_b" = {
      username    = "example.b"
      email       = "example.b@company.com"
      given_name  = "Example"
      family_name = "B"
    }
  }
}

variable "developer_users" {
  description = "Developer team users"
  type = map(object({
    username    = string
    email       = string
    given_name  = string
    family_name = string
  }))
  default = {
    "guy_a" = {
      username    = "guy.a"
      email       = "guy.a@company.com"
      given_name  = "Guy"
      family_name = "A"
    }
    "guy_b" = {
      username    = "guy.b"
      email       = "guy.b@company.com"
      given_name  = "Guy"
      family_name = "B"
    }
  }
}

variable "accounts" {
  description = "AWS accounts to create"
  type = map(object({
    name  = string
    email = string
  }))
  default = {
    "dev" = {
      name  = "Development"
      email = "aws-dev@company.com"
    }
    "stage" = {
      name  = "Staging"
      email = "aws-stage@company.com"
    }
    "prod" = {
      name  = "Production"
      email = "aws-prod@company.com"
    }
  }
}