terraform {
  required_providers {
    ansiblevault = {
      source  = "MeilleursAgents/ansiblevault"
      version = "2.2.0"
    }
  }
}

variable "vault_pass" {
  type = string
}

#  See https://github.com/MeilleursAgents/terraform-provider-ansiblevault/blob/master/README.md for installation and usage
provider "ansiblevault" {
  vault_pass  = var.vault_pass
  root_folder = "../"
}

data "ansiblevault_string" "key_string" {
  encrypted = file("../secret.json")
}

data "ansiblevault_string" "preprod" {
  encrypted = file("preproduction.json")
}


locals {
  preproduction = jsondecode(data.ansiblevault_string.preprod.value)
  production    = jsondecode(data.ansiblevault_string.key_string.value)
}

output "key_string" {
  value     = local.production
  sensitive = true
}

output "preprod" {
  value     = { for k, v in local.preproduction : k => v }
  sensitive = true
}

output "test" {
  value = merge(local.production, local.preproduction)
}
