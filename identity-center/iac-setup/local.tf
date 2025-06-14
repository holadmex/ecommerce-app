# locals.tf - Local values and computed data

locals {
  # Identity Center configuration
  identity_store_id = tolist(data.aws_ssoadmin_instances.main.identity_store_ids)[0]
  sso_instance_arn  = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  
  # Common tags applied to all resources
  common_tags = {
    ManagedBy   = "terraform"
    Environment = "multi"
    Project     = "identity-center-setup"
  }
  
  # Account environment mapping for easier reference
  account_environments = {
    for k, v in var.accounts : k => {
      name         = v.name
      email        = v.email
      environment  = k
      is_prod      = k == "prod"
      allow_devs   = k != "prod"  # Developers get access to non-prod only
    }
  }
  
  # User mappings for easier management
  all_users = merge(var.devops_users, var.developer_users)
  
  # Permission set configurations
  permission_sets = {
    devops = {
      name             = "DevOpsFullAdmin"
      description      = "Full administrative access for DevOps team"
      session_duration = "PT8H"
      managed_policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
    }
    developer = {
      name             = "DeveloperReadOnly"
      description      = "Read-only access for developers"
      session_duration = "PT4H"
      managed_policies = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
    }
  }
}