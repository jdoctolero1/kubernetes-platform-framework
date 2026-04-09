resource "azurerm_application_gateway" "app_gw" {
	name                = var.agw_name
	location            = var.location
	resource_group_name = var.resource_group_name

	sku {
		name     = var.sku_name
		tier     = var.sku_tier
		capacity = var.sku_capacity
	}
	gateway_ip_configuration {
		name      = local.gateway_ip_configuration_name
		subnet_id = var.subnet_id
	}
	frontend_port {
		name = local.frontend_http_port_name
		port = var.frontend_http_port
	}
	frontend_ip_configuration {
		name                 = local.frontend_ip_configuration_name
        public_ip_address_id = var.public_ip_id
	}
	backend_address_pool {
		name  = local.backend_address_pool_name
		ip_addresses = var.backend_ip_addresses
	}
	backend_http_settings {
		name                  = local.backend_http_settings_name
		cookie_based_affinity = "Disabled"
		port                  = var.backend_port
		protocol              = "Http"
		pick_host_name_from_backend_address = false
	}
	http_listener {
		name                           = local.http_listener_name
		frontend_ip_configuration_name = local.frontend_ip_configuration_name
		frontend_port_name             = local.frontend_http_port_name
		protocol                       = "Http"
	}
	redirect_configuration {
		name                 = local.redirect_configuration_name
		redirect_type        = "Permanent"
		target_listener_name = local.https_listener_name
		include_path         = true
		include_query_string = true
	}
	request_routing_rule {
		name                        = local.request_routing_rule_name
		rule_type                   = "Basic"
		http_listener_name          = local.http_listener_name
		redirect_configuration_name = local.redirect_configuration_name
		priority                    = 9
	}
	ssl_certificate {
        name                = local.ssl_certificate_name
        key_vault_secret_id = var.ssl_secret_id
    }
	http_listener {
		name                           = local.https_listener_name
		frontend_ip_configuration_name = local.frontend_ip_configuration_name
		frontend_port_name             = local.frontend_port_https_name
		protocol                       = "Https"
		ssl_certificate_name           = local.ssl_certificate_name
	}
	frontend_port {
		name = local.frontend_port_https_name
		port = 443
	}
	request_routing_rule {
		name                       = local.request_routing_rule_https_name
		rule_type                  = "Basic"
		http_listener_name         = local.https_listener_name
		backend_address_pool_name  = local.backend_address_pool_name
		backend_http_settings_name = local.backend_http_settings_name
		priority                   = 10
	}

	identity {
	  type = "UserAssigned"
	  identity_ids = [var.user_assigned_identity_id]
	}

	tags = var.tags
}