# accounts.tf - AWS account management configuration

# Get the organization information
data "aws_organizations_organization" "main" {}

# Create AWS accounts
resource "aws_organizations_account" "accounts" {
  for_each = var.accounts

  name      = "${var.organization_name}-${each.value.name}"
  email     = each.value.email
  role_name = "OrganizationAccountAccessRole"

  # Enable IAM user access to billing
  iam_user_access_to_billing = "ALLOW"

  tags = {
    Environment = each.key
    Purpose     = each.value.name
    ManagedBy   = "terraform"
  }

  lifecycle {
    ignore_changes = [role_name]
  }
}

# Wait for accounts to be created and settled
resource "time_sleep" "account_creation_delay" {
  depends_on = [aws_organizations_account.accounts]

  create_duration = "30s"
}