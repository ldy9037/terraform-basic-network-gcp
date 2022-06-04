terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.20.0"
    }
  }

  backend "gcs" {}

  required_version = ">= 1.1.7"
}

provider "google" {
  region = var.region
}

module "interconnect_vpc" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = "5.1.0"

  project_id   = var.project_id
  network_name = var.interconnect_vpc_name
  description  = var.interconnect_vpc_description
  mtu          = var.interconnect_vpc_mtu

  delete_default_internet_gateway_routes = var.interconnect_vpc_delete_default_igw
}
