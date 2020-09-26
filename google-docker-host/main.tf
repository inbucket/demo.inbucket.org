provider "google" {
  credentials = file("../credentials.json")
  project = "terraform-290700"
  region = "us-west1"
}

// Used to create random machine IDs.
resource "random_id" "instance_id" {
  byte_length = 8
}

resource "google_compute_address" "docker_host" {
  name = "docker-addr-${random_id.instance_id.hex}"
}

resource "google_compute_instance" "docker_host" {
  name = "docker-${random_id.instance_id.hex}"
  machine_type = "e2-micro"
  zone = "us-west1-b"

  boot_disk {
    initialize_params {
      image = "confidential-vm-images/cos-stable"
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.docker_host.address
    }
  }
}

output "public_ip_addr" {
  value = google_compute_address.docker_host.address
}
