# main.tf has to be applied first

#Engineers ---------------------------------------------------------------
resource "azuread_group" "engineering" {
  display_name = "Engineering"
  security_enabled = true
}

resource "azuread_group_member" "engineering" {
  for_each = {
    for user in local.users : user.first_name => user
    if user.department == "Engineering"
  }

  group_object_id  = azuread_group.engineering.id
  member_object_id = azuread_user.users[each.key].id
}

# Leadership --------------------------------------------------------------
resource "azuread_group" "leadership" {
  display_name = "Leadership"
  security_enabled = true
}

resource "azuread_group_member" "leadership" {
  for_each = {
    for user in local.users : user.first_name => user
    if user.department == "Leadership"
  }

  group_object_id  = azuread_group.leadership.id
  member_object_id = azuread_user.users[each.key].id
}

# Finance ----------------------------------------------------------------
resource "azuread_group" "finance" {
  display_name = "Finance"
  security_enabled = true
}

resource "azuread_group_member" "finance" {
  for_each = {
    for user in local.users : user.first_name => user
    if user.department == "Finance"
  }

  group_object_id  = azuread_group.finance.id
  member_object_id = azuread_user.users[each.key].id
}