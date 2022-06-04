variable "region" {
  description = "GCP Region"
  type        = string
}

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "interconnect_vpc_name" {
  description = "Interconnect 용 VPC Name"
  type        = string
}

variable "interconnect_vpc_description" {
  description = "Interconnect 용 VPC 설명"
  type        = string
}

variable "interconnect_vpc_mtu" {
  description = "Interconnect 용 VPC MTU"
  type        = number
}

variable "interconnect_vpc_delete_default_igw" {
  description = "Interconnect 용 VPC 내 default IGW와 Route 삭제 여부"
  type        = bool
}