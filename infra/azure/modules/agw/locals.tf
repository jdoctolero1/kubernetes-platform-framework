locals {
  gateway_ip_configuration_name  = "${var.agw_name}-gwipcfg"
  backend_address_pool_name      = "${var.agw_name}-beap"
  frontend_port_name             = "${var.agw_name}-feport"
  frontend_ip_configuration_name = "${var.agw_name}-feip"
  backend_http_settings_name     = "${var.agw_name}-be-sett"
  http_setting_name              = "${var.agw_name}-be-htst"
  http_listener_name             = "${var.agw_name}-httplstn"
  request_routing_rule_name      = "${var.agw_name}-rqrt"
  redirect_configuration_name    = "${var.agw_name}-rdrcfg"
}