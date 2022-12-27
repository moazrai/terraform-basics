# terraform-basics

A git repository that I use to try terraform.

## Configuring the Remote Backend to use Azure Storage with Terraform

Use Microsoft Azure Storage to create a Remote Backend for Terraform to store the state file and lock the file to avoid mistakes or damage the existing infrastructure.

Use Terraform to create the storage account in Azure Storage.

[Reference](https://developer.hashicorp.com/terraform/language/settings/backends/azurerm)

## Automate Terraform with GitHub Actions

Automating Terraform with CI/CD to enforce configuration best practices, promote collaboration and automate the Terraform workflow.

Note: In the production environment, add "Require status checks to pass before merging" as a Branch Protection rule. This adds a layer of protection, ensuring that this workflow successfully completes before changes are merged into main.

[Reference](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions#github-actions)
