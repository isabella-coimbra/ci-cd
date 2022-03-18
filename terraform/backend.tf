terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.66.0"
    }
  }

  backend gcs {
    bucket = "terraform-states"
    prefix = "tf-state-dev"
  }
}

