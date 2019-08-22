resource "azurerm_availability_set" "isavailabilityset" {
  name                         = "isavailabilityset"
  resource_group_name          = "${var.resource_group_name}"
  location                     = "${var.location}"
  platform_fault_domain_count  = 3
  platform_update_domain_count = 5
  managed                      = true
}

resource "azurerm_virtual_machine" "iis" {
  name                          = "${var.prefix}-iis${1 + count.index}"
  location                      = "${var.location}"
  availability_set_id           = "${azurerm_availability_set.isavailabilityset.id}"
  resource_group_name           = "${var.resource_group_name}"
  network_interface_ids         = ["${element(azurerm_network_interface.primary.*.id, count.index)}"]
  vm_size                       = "Standard_A1"
  delete_os_disk_on_termination = true
  count                         = "${var.vmcount}"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2012-R2-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-iis${1 + count.index}-disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.prefix}-iis${1 + count.index}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = false

    additional_unattend_config {
      pass         = "oobeSystem"
      component    = "Microsoft-Windows-Shell-Setup"
      setting_name = "AutoLogon"
      content      = "<AutoLogon><Password><Value>${var.admin_password}</Value></Password><Enabled>true</Enabled><LogonCount>1</LogonCount><Username>${var.admin_username}</Username></AutoLogon>"
    }

    # Unattend config is to enable basic auth in WinRM, required for the provisioner stage.
    additional_unattend_config {
      pass         = "oobeSystem"
      component    = "Microsoft-Windows-Shell-Setup"
      setting_name = "FirstLogonCommands"
      content      = "${file("${path.module}/files/FirstLogonCommands.xml")}"
    }
  }
  depends_on = ["azurerm_network_interface.primary"]
}
