provider "azurerm" {

  version = "=2.20.0"
  features {}
}
resource "azurerm_public_ip" "publicip" {
  count               = 2
  name                = "csr1000v_r${count.index}"
  location            = "westeurope"
  resource_group_name = "terraform_demo"
  allocation_method   = "Static"
}
# resource "azurerm_resource_group" "terraform_demo" {
#   name     = var.resource_group_name
#   location = "West Europe"
# }

# # Create a virtual network
# resource "azurerm_virtual_network" "vnet" {
#   name                = "csr1000vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.terraform_demo.location
#   resource_group_name = azurerm_resource_group.terraform_demo.name
# }

# # Create subnet
# resource "azurerm_subnet" "subnet" {
#   name                 = "crs1000vSubnet"
#   resource_group_name  = azurerm_resource_group.terraform_demo.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# #Create public IP
# resource "azurerm_public_ip" "publicip" {
#   count               = length(var.vm_instance_name)
#   name                = "${element(var.vm_instance_name, count.index)}.PubIP"
#   location            = azurerm_resource_group.terraform_demo.location
#   resource_group_name = azurerm_resource_group.terraform_demo.name
#   allocation_method   = "Static"
# }


# # Create network interface
# resource "azurerm_network_interface" "nic" {
#   name                = "myNIC"
#   location            = azurerm_resource_group.terraform_demo.location
#   resource_group_name = azurerm_resource_group.terraform_demo.name

#   ip_configuration {
#     name                          = "myNICConfg"
#     subnet_id                     = azurerm_subnet.subnet.id
#     private_ip_address_allocation = "dynamic"
#     public_ip_address_id          = azurerm_public_ip.publicip.id
#   }
# }

# # Create Network Security Group and rule
# resource "azurerm_network_security_group" "nsg" {
#   name                = "csr1000vNSG"
#   location            = azurerm_resource_group.terraform_demo.location
#   resource_group_name = azurerm_resource_group.terraform_demo.name

#   security_rule {
#     name                       = "SSH"
#     priority                   = 1001
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_network_interface_security_group_association" "nic-nsg" {
#   network_interface_id      = azurerm_network_interface.nic.id
#   network_security_group_id = azurerm_network_security_group.nsg.id
# }


# # Create a Linux virtual machine
# resource "azurerm_virtual_machine" "csr_router" {
#   name                  = "csr1000v-r1"
#   location              = azurerm_resource_group.terraform_demo.location
#   resource_group_name   = azurerm_resource_group.terraform_demo.name
#   network_interface_ids = [azurerm_network_interface.nic.id]
#   vm_size               = "Standard_DS1_v2"

#   plan {
#     publisher = "cisco"
#     product   = "cisco-csr-1000v"
#     name      = "17_2_1-payg-sec"
#   }
#   storage_os_disk {
#     name              = "myOsDisk"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Premium_LRS"
#   }

#   storage_image_reference {
#     publisher = "cisco"
#     offer     = "cisco-csr-1000v"
#     sku       = "17_2_1-payg-sec"
#     version   = "17.2.120200508"
#   }

#   os_profile {
#     computer_name  = "csr1000v-r1"
#     admin_username = var.admin_username
#     admin_password = var.admin_password
#   }

#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
# }
