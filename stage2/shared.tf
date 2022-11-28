# IPsec shared key can't start with digit 0
resource "random_password" "first_letter" {
  length  = 1
  numeric = false
  special = false
}

resource "random_password" "remainder" {
  length           = 31
  override_special = "._"
}

locals {
  shared_key = "${random_password.first_letter.result}${random_password.remainder.result}"
}
