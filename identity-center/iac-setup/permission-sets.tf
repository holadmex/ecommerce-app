# permission-sets.tf - Permission set configuration

# DevOps Full Admin Permission Set
resource "aws_ssoadmin_permission_set" "devops_full_admin" {
  instance_arn     = local.sso_instance_arn
  name             = "DevOpsFullAdmin"
  description      = "Full administrative access for DevOps team"
  session_duration = "PT8H"

  tags = {
    Team        = "DevOps"
    AccessLevel = "FullAdmin"
    ManagedBy   = "terraform"
  }
}

# Attach AWS managed policy for full admin access
resource "aws_ssoadmin_managed_policy_attachment" "devops_admin_policy" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.devops_full_admin.arn
}

# Developer Read Only Permission Set
resource "aws_ssoadmin_permission_set" "developer_read_only" {
  instance_arn     = local.sso_instance_arn
  name             = "DeveloperReadOnly"
  description      = "Read-only access for developers"
  session_duration = "PT4H"

  tags = {
    Team        = "Development"
    AccessLevel = "ReadOnly"
    ManagedBy   = "terraform"
  }
}

# Attach AWS managed policy for read-only access
resource "aws_ssoadmin_managed_policy_attachment" "developer_readonly_policy" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.developer_read_only.arn
}

# Optional: Create a custom inline policy for developers with some additional permissions
resource "aws_ssoadmin_permission_set_inline_policy" "developer_additional_permissions" {
  inline_policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "cloudformation:ValidateTemplate",
          "cloudformation:EstimateTemplateCost"
        ]
        Resource = "*"
      }
    ]
  })
  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.developer_read_only.arn
}