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

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "5.1.0"

  project_id   = var.project_id
  network_name = "${terraform.workspace}-${var.vpc_name}"
  description  = var.vpc_description
  mtu          = var.vpc_mtu

  subnets = [
    for s in var.subnets :
    {
      subnet_name                  = "${terraform.workspace}-${s.subnet_name}"
      subnet_ip                    = s.subnet_ip
      subnet_region                = var.region
      subnet_private_access        = s.subnet_private_access
      subnet_flow_logs             = s.subnet_flow_logs
      subnet_flow_logs_interval    = s.subnet_flow_logs_interval
      subnet_flow_logs_sampling    = s.subnet_flow_logs_sampling
      subnet_flow_logs_metadata    = s.subnet_flow_logs_metadata
      subnet_flow_logs_filter_expr = s.subnet_flow_logs_filter_expr
      description                  = s.description
    }
  ]
}



/*
별도의 Repository로 이전예정
module "interconnect_vpc" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = "5.1.0"

  project_id   = var.project_id
  network_name = var.interconnect_vpc_name
  description  = var.interconnect_vpc_description
  mtu          = var.interconnect_vpc_mtu

  delete_default_internet_gateway_routes = var.interconnect_vpc_delete_default_igw
}
*/
