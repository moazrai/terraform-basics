# terraform-basics

A git repository that I use to try terraform.


## Terraform Workflow Status

[![Terraform](https://github.com/moazrai/terraform-basics/actions/workflows/terraform.yaml/badge.svg?branch=main&event=push)](https://github.com/moazrai/terraform-basics/actions/workflows/terraform.yaml)

### Release Runbook
1. Add a commit on a new branch with the changes
2. Create a pull request into the main branch. This will trigger a workflow to:
   1. Validate syntax of Terraform code (will catch the missing double-quote that happened before)
   2. Check correct code formatting
   3. Run the plan command and add a comment to the PR with the output plan changes
   4. Run a static code analysis tool for scanning IaC files for misconfigurations that may lead to security or compliance problems (such as Checkov, tfsec or Snyk)
3. Reviewer reviews code changes from the PR (if all checks have passed) and also review plan changes from the PR as well
4. If the plan is okay, merge PR into main. This will trigger a workflow to run terraform apply to apply the plan

### Notes:
- We can trigger the apply workflow on creating a release instead of merging to main
- Branch protection rule on main branch is added to not allow merging into main without having all the checks passed

## Configuring the Remote Backend to use Azure Storage with Terraform

Use Microsoft Azure Storage to create a Remote Backend for Terraform to store the state file and lock the file to avoid mistakes or damage the existing infrastructure.

Use Terraform to create the storage account in Azure Storage.

[Reference](https://developer.hashicorp.com/terraform/language/settings/backends/azurerm)

## Automate Terraform with GitHub Actions

Automating Terraform with CI/CD to enforce configuration best practices, promote collaboration and automate the Terraform workflow.

Note: In the production environment, add "Require status checks to pass before merging" as a Branch Protection rule. This adds a layer of protection, ensuring that this workflow successfully completes before changes are merged into main.

[Reference](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions#github-actions)

## Useful Links

- [Checkov](https://www.checkov.io/4.Integrations/GitHub%20Actions.html)
- [Tfsec](https://github.com/marketplace/actions/run-tfsec-with-sarif-upload)
- [Terrascan](https://runterrascan.io/docs/integrations/cicd/)
