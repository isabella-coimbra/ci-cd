variable "project_id" {
  description = "The name of GCP project"
  type        = string
  default     = ""
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-east1"
}

variable "account_id" {
  description = "Id of the Service account"
  type        = string
  default     = ""
}

variable "name" {
  description = "Name of the instance"
  type        = string
  default     = ""
}

variable "zone" {
  description = "Zone of the instance"
  type        = string
  default     = "us-east1-b"
}

variable "machine_type" {
  description = "The machine type for compute instances use"
  type        = string
  default     = "e2-medium"
}

variable "boot_disk_type" {
  description = "The disk type for compute instance use"
  type        = string
  default     = "pd-standard"
}

variable "boot_disk_size" {
  description = "Boot disk size"
  type        = number
  default     = 10
}

variable "subnetwork" {
  description = "Subnetwork for the project"
  type        = string
  default     = ""
}

variable "network_ip" {
  description = "Ip for the instance"
  type        = string
  default     = ""
}

variable "image_path" {
  description = "Instance image path"
  type        = string
  default     = ""
}
