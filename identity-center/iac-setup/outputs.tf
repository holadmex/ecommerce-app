# outputs.tf - Output values

output "identity_center_instance_arn" {
  description = "ARN of the Identity Center instance"
  value       = local.sso_instance_arn
}

output "identity_store_id" {
  description = "Identity Store ID"
  value       = local.identity_store_id
}

output "devops_group_id" {
  description = "DevOps group ID"
  value       = aws_identitystore_group.devops.group_id
}

output "developers_group_id" {
  description = "Developers group ID"
  value       = aws_identitystore_group.developers.group_id
}

output "devops_users" {
  description = "DevOps users information"
  value = {
    for k, v in aws_identitystore_user.devops_users : k => {
      user_id      = v.user_id
      username     = v.user_name
      display_name = v.display_name
    }
  }
}

output "developer_users" {
  description = "Developer users information"
  value = {
    for k, v in aws_identitystore_user.developer_users : k => {
      user_id      = v.user_id
      username     = v.user_name
      display_name = v.display_name
    }
  }
}

output "aws_accounts" {
  description = "Created AWS accounts"
  value = {
    for k, v in aws_organizations_account.accounts : k => {
      id    = v.id
      name  = v.name
      email = v.email
      arn   = v.arn
    }
  }
}

output "permission_sets" {
  description = "Permission sets information"
  value = {
    devops_full_admin = {
      arn  = aws_ssoadmin_permission_set.devops_full_admin.arn
      name = aws_ssoadmin_permission_set.devops_full_admin.name
    }
    developer_read_only = {
      arn  = aws_ssoadmin_permission_set.developer_read_only.arn
      name = aws_ssoadmin_permission_set.developer_read_only.name
    }
  }
}

output "identity_center_url" {
  description = "AWS Identity Center access URL"
  value       = "https://${split("/", local.sso_instance_arn)[1]}.awsapps.com/start"
}