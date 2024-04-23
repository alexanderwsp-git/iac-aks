terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "nonprodstorageterraform"
    container_name       = "nonprodcontaineraksterraform"
    key                  = "terraform.tfstate"
    resource_group_name  = "nonprod"
    client_id            = "a1fdb38b-90ac-4ca0-bbcd-e3b0c2050ffb"
    client_secret        = "GYc8Q~u1yM_B0b3Mkes~PkfdiOksFXzMo6pX5bHt"
    tenant_id            = "ea056b77-7270-44b5-8de9-9f77eb8d8a7b"
    subscription_id      = "6eb45b59-3ead-4817-9b4b-5201ac067738"
  }
}

provider "azurerm" {
  features {}
}
