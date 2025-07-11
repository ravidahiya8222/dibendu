terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }
  #    backend "azurerm" {

  #   tenant_id            = "0764505e-69bd-4239-bdb8-e97e276c0768"  
  #   subscription_id      = "7cfefeda-2965-424b-b4df-23e891842246"  
  #   resource_group_name  = "ravirg"        
  #   storage_account_name = "ravistorage"                             
  #   container_name       = "tfstate"                               
  #   key                  = "terraform.tfstate"                
  # }
}


provider "azurerm" {
  features {}
  subscription_id = "7cfefeda-2965-424b-b4df-23e891842246"
  # Configuration options
}