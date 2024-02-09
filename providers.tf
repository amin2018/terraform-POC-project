// This block configures the Google provider with the project ID, region, and zone from variables.
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "kubernetes" {
  host                   = "https://${module.gke.gke_cluster_endpoint}"
  token                  = module.gke.gke_cluster_access_token
  cluster_ca_certificate = base64decode(module.gke.gke_cluster_ca_certificate)
}

terraform {
  required_version = ">= 0.12.7"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.15.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}