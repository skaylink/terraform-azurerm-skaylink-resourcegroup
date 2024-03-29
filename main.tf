# A Terraform module to create a subset of cloud components
# Copyright (C) 2022 Skaylink GmbH

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# For questions and contributions please contact info@iq3cloud.com

resource "azurerm_resource_group" "resource_group" {

  name     = var.name
  location = var.location
  tags     = var.tags
}

resource "azurerm_management_lock" "lock" {
  count      = var.lock == true ? 1 : 0
  name       = var.lock_level
  scope      = azurerm_resource_group.resource_group.id
  lock_level = var.lock_level
}
