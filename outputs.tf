## VM Outputs

output "resource_group_id" {
  value = azurerm_resource_group.vm-rg.id
}

output "tls_private_key" {
  value     = tls_private_key.vm_ssh_pk.private_key_pem
  sensitive = true
}

output "vm_public_ip" {
  value = azurerm_public_ip.vm_public_ip.ip_address
}


## State Outputs

output "terraform_state_resource_group_name" {
  value = azurerm_resource_group.state-rg.name
}

output "terraform_state_storage_account" {
  value = azurerm_storage_account.state-sta.name
}

output "terraform_state_storage_container_core" {
  value = azurerm_storage_container.core-container.name
}
