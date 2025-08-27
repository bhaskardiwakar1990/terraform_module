terraform {
  required_providers {
    azurerm = {
      version = "4.21.1"
      source  = "hashicorp/azurerm"
    }
  }

#   backend "azurerm" {
#     resource_group_name  = "value"
#     storage_account_name = "container"
#     container_name       = "value"
#     key                  = "prod.terraform.tfstate"
#   }

}

provider "azurerm" {
  features {}
  subscription_id = "8cd460d7-7d47-45fe-97c6-425f0f5b12dd"
}
///////////////////////////////