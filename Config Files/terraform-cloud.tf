# run terraform login to authenticate with Terraform cloud.
# add the API token locally
# add the cloud block to your Terraform configuration

terraform {
  cloud {
    organization = "my-org"
    workspaces {
      tags = ["networking"]
    }
  }
}
