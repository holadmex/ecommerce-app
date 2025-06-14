# users.tf - User management configuration

# Create DevOps users
resource "aws_identitystore_user" "devops_users" {
  for_each = var.devops_users

  identity_store_id = local.identity_store_id
  display_name      = "${each.value.given_name} ${each.value.family_name}"
  user_name         = each.value.username

  name {
    given_name  = each.value.given_name
    family_name = each.value.family_name
  }

  emails {
    value   = each.value.email
    primary = true
    type    = "work"
  }

  tags = {
    Team        = "DevOps"
    Environment = "all"
    ManagedBy   = "terraform"
  }
}

# Create Developer users
resource "aws_identitystore_user" "developer_users" {
  for_each = var.developer_users

  identity_store_id = local.identity_store_id
  display_name      = "${each.value.given_name} ${each.value.family_name}"
  user_name         = each.value.username

  name {
    given_name  = each.value.given_name
    family_name = each.value.family_name
  }

  emails {
    value   = each.value.email
    primary = true
    type    = "work"
  }

  tags = {
    Team        = "Development"
    Environment = "dev-stage"
    ManagedBy   = "terraform"
  }
}