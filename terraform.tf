variable "gcp_creds" {
    type    = "string"
    default = "creds.json"
}

variable "gcp_project" {
    type    = "string"
}

variable "gcp_region" {
    type    = "string"
}


provider "google" {
    credentials = "${file(var.gcp_creds)}"
    project     = "${var.gcp_project}"
    region      = "${var.gcp_region}"
}

resource "google_compute_instance" "default" {
    name         = "test"
    machine_type = "n1-standard-1"
    zone         = "us-central1-a"

    boot_disk {
        initialize_params {
        image   = "debian-cloud/debian-8"
        }
    }

    network_interface {
        network = "default"

        access_config {
        }
    }
}
