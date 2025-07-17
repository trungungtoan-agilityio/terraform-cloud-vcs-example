output "domain-name" {
  value = azurerm_public_ip.main.fqdn
}

output "application-url" {
  value = "http://${azurerm_public_ip.main.ip_address}/index.php"
}

output "public-ip" {
  value = azurerm_public_ip.main.ip_address
}
