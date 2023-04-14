# Terraform Module Overlay Remote State

Automates remote state generation for faster development, testing, and deployment times.

## Purpose

Creates a remote-state resource group within a single subscription that manages multiple Terraform workspaces. This accelerator uses a combination of git tags and GitHub actions to automate the selection of the statefile.

### Resources Created
Resource Group
KeyVault
App Registration
Service Principal Name
Storage Account
Storage Container


## Usage

### Prequisites:

You must create a new github repository to host your terraform code. Create the repository on GitHub.

**DO NOT** Initialize a local branch.
**DO NOT** Stage any commits.

Leave the repository in the default new state

![New-Repo](./assets/new-repo.png)

Clone this repo to your desired local directory

```
git clone https://github.com/CurtisSlone/terraform-module-overlays-remote-state-accelerator
cd terraform-module-overlays-remote-state-accelerator
```

Log-In using AZ cli and set your desired subscription
```
az login
az account list
az account set --subscription "SUBSCRIPTION NAME"
```

Now you must initialize, plan and apply the semote state backend. In your current directory, execute the following commands.

```
terraform init
terraform plan
terrafor apply --auto-approve
```
### Obtaining Client Secret
```
terraform output -json client_secret
```