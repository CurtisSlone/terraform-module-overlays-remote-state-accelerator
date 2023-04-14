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

Clone this repo to your desired directory

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


### Prerequisites

Use az cli to login to the subscription that your remote state backend will be hosted.

```
az login
az account set --subscription <subscription-ID>
```

### Creation Flow


### Obtaining Client Secret
```
terraform output -json client_secret
```