resource "azurerm_public_ip" "load_balancer_ip" {
  name                = "${var.lb_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
  tags                = var.tags
}

resource "azurerm_lb" "load_balancer" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"
  frontend_ip_configuration {
    name                 = "PublicFrontend"
    public_ip_address_id = azurerm_public_ip.load_balancer_ip.id
  }
  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = "${var.lb_name}-backendpool"
  loadbalancer_id = azurerm_lb.load_balancer.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_backend_association" {
  count                   = length(var.vm_nics)
  network_interface_id    = var.vm_nics[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
  ip_configuration_name   = "internal"
}
