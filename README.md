# Terraform Module Overlay Remote State

Automates remote state generation for faster development, testing, and deployment times.

## Purpose

Creates a network artifacts group that store multiple terraform state files for a single subscription.
The intent is that it will be combined with GitHub actions. Tags will trigger which workspace will be used.

#### Key Features
Creates two security groups: KV-Admins & KV-Readers
Creates an SPN for management over the current subscription
Adds current user to KV-Admins,
Adds SPN to KV-Readers
Creates a Keyvault for the SAS
Creates Storage Account and Storage Container
Takes an array of strings with the terraform key file names to segregate work spaces.




### Resources Created
Resource Group
KeyVault
App Registration
Service Principal Name
Storage Account
Storage Container



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