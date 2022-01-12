resource "azurerm_linux_virtual_machine" "bad_linux_example" {
  name                            = "bad-linux-machine"
  resource_group_name             = var.name
  location                        = var.location
  size                            = "Standard_F2"
  admin_username                  = "adminuser"
  admin_password                  = "somePassword"
  disable_password_authentication = false
}

resource "azurerm_virtual_machine" "bad_example" {
    name                            = "bad-linux-machine"
    resource_group_name             = var.name
    location                        = var.location
    size                            = "Standard_F2"
    admin_username                  = "adminuser"
    admin_password                  = "somePassword"

    os_profile {
        computer_name  = "hostname"
        admin_username = "testadmin"
        admin_password = "Password1234!"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }
  }