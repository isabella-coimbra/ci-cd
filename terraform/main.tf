provider "google" {
  project = var.project_id
  region  = var.region
}

# Criando Service Account
resource "google_service_account" "sa" {
  account_id   = var.account_id
  display_name = "User for ${var.name}"
}

# Criando Instância
resource "google_compute_instance" "vm" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  enable_display = false
  boot_disk {
    initialize_params {
      image = var.image_path
      size  = var.boot_disk_size
      type  = var.boot_disk_type

    }
  }
    network_interface {
      subnetwork = var.subnetwork
      network_ip = var.network_ip
  }

  labels = {
    env        = "dev",
  }

  tags = [
     "default-access"
  ]

  service_account {
    email  = google_service_account.sa.email
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }

  metadata = {
    enable-oslogin  = "TRUE"
    "VmDnsSettings" = "ZonalOnly"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  timeouts {}
}




