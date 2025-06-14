# groups.tf - Group management configuration

# Create DevOps group
resource "aws_identitystore_group" "devops" {
  identity_store_id = local.identity_store_id
  display_name      = "DevOps"
  description       = "DevOps team with full administrative access"

  tags = {
    Team      = "DevOps"
    Access    = "FullAdmin"
    ManagedBy = "terraform"
  }
}

# Create Developers group
resource "aws_identitystore_group" "developers" {
  identity_store_id = local.identity_store_id
  display_name      = "Developers"
  description       = "Development team with read-only access"

  tags = {
    Team      = "Development"
    Access    = "ReadOnly"
    ManagedBy = "terraform"
  }
}

# Add DevOps users to DevOps group
resource "aws_identitystore_group_membership" "devops_membership" {
  for_each = aws_identitystore_user.devops_users

  identity_store_id = local.identity_store_id
  group_id          = aws_identitystore_group.devops.group_id
  member_id         = each.value.user_id
}

# Add Developer users to Developers group
resource "aws_identitystore_group_membership" "developer_membership" {
  for_each = aws_identitystore_user.developer_users

  identity_store_id = local.identity_store_id
  group_id          = aws_identitystore_group.developers.group_id
  member_id         = each.value.user_id
}