# assignments.tf - Permission assignments configuration

# DevOps group assignments to all accounts with full admin access
resource "aws_ssoadmin_account_assignment" "devops_assignments" {
  for_each = aws_organizations_account.accounts

  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.devops_full_admin.arn

  principal_id   = aws_identitystore_group.devops.group_id
  principal_type = "GROUP"

  target_id   = each.value.id
  target_type = "AWS_ACCOUNT"

  depends_on = [
    time_sleep.account_creation_delay,
    aws_ssoadmin_managed_policy_attachment.devops_admin_policy
  ]
}

# Developer group assignments to dev and stage accounts only with read-only access
resource "aws_ssoadmin_account_assignment" "developer_assignments" {
  for_each = {
    for k, v in aws_organizations_account.accounts : k => v
    if k == "dev" || k == "stage"
  }

  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.developer_read_only.arn

  principal_id   = aws_identitystore_group.developers.group_id
  principal_type = "GROUP"

  target_id   = each.value.id
  target_type = "AWS_ACCOUNT"

  depends_on = [
    time_sleep.account_creation_delay,
    aws_ssoadmin_managed_policy_attachment.developer_readonly_policy,
    aws_ssoadmin_permission_set_inline_policy.developer_additional_permissions
  ]
}