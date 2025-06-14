# terraform.tfvars.example - Example variable values
# Copy this file to terraform.tfvars and customize the values

aws_region        = "us-east-1"
organization_name = "MyCompany"

# DevOps team users
devops_users = {
  "example_a" = {
    username    = "example.a"
    email       = "example.a@mycompany.com"
    given_name  = "Example"
    family_name = "A"
  }
  "example_b" = {
    username    = "example.b"
    email       = "example.b@mycompany.com"
    given_name  = "Example"
    family_name = "B"
  }
}

# Developer team users
developer_users = {
  "guy_a" = {
    username    = "guy.a"
    email       = "guy.a@mycompany.com"
    given_name  = "Guy"
    family_name = "A"
  }
  "guy_b" = {
    username    = "guy.b"
    email       = "guy.b@mycompany.com"
    given_name  = "Guy"
    family_name = "B"
  }
}

# AWS accounts to create
accounts = {
  "dev" = {
    name  = "Development"
    email = "aws-dev@mycompany.com"
  }
  "stage" = {
    name  = "Staging"
    email = "aws-stage@mycompany.com"
  }
  "prod" = {
    name  = "Production"
    email = "aws-prod@mycompany.com"
  }
}