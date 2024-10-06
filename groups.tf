resource "azuread_group" "engineering" {
  display_name = "Engineering Department"
  security_enabled = true
}

resource "azuread_group_member" "engineering" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.department == "Engineering" }

  group_object_id  = azuread_group.engineering.id
  member_object_id = each.value.id
}

resource "azuread_group" "leadership" {
  display_name = "Leadership Team"
  security_enabled = true
}

resource "azuread_group_member" "leadership" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.department == "Leadership" }

  group_object_id  = azuread_group.leadership.id
  member_object_id = each.value.id
}

resource "azuread_group" "finance" {
  display_name = "Finance Department"
  security_enabled = true
}

resource "azuread_group_member" "finance" {
  for_each = { for u in azuread_user.users: u.mail_nickname => u if u.department == "Finance Department" }

  group_object_id  = azuread_group.finance.id
  member_object_id = each.value.id
}