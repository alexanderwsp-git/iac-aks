terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "nonprodstorageterraform"
    container_name       = "nonprodcontaineraksterraform"
    key                  = "terraform.tfstate"
    resource_group_name  = "nonprod"
  }
}