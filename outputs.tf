output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "tls_private_key" {
  value     = tls_private_key.vm_ssh_pk.private_key_pem
  sensitive = true
}

output "vm_public_ip" {
  value = azurerm_public_ip.vm_public_ip.ip_address
}
