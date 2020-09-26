provider "google" {
  credentials = file("credentials.json")
  project = "terraform-290700"
  region = "us-west1"
}

data "terraform_remote_state" "docker_host" {
  backend = "local"
  config = {
    path = "./google-docker-host/terraform.tfstate"
  }
}

provider "docker" {
  host = format("ssh://james@%v:22", data.terraform_remote_state.docker_host.outputs.public_ip_addr)
}

// Containers.

resource "docker_container" "inbucket" {
  name = "inbucket"
  image = docker_image.inbucket.latest
  restart = "unless-stopped"
  network_mode = "inbucket_net"
  env = [
    "INBUCKET_STORAGE_RETENTIONPERIOD=4h"
  ]
  ports {
    internal = 2500
    external = 2500
  }
  ports {
    internal = 9000
    external = 80
  }
}

resource "docker_container" "fauxmailer" {
  name = "fauxmailer"
  image = docker_image.fauxmailer.latest
  restart = "unless-stopped"
  network_mode = "inbucket_net"
  //command = "fauxmailer -host inbucket:2500 -tofile /config/addrlist.txt -every 10s"
  command = ["fauxmailer", "-host", "inbucket:2500", "-every", "10s"]
}

// Networks.

resource "docker_network" "inbucket_net" {
  name = "inbucket_net"
}

// Images.

resource "docker_image" "inbucket" {
  name = "inbucket/inbucket:latest"
}

resource "docker_image" "fauxmailer" {
  name = "inbucket/fauxmailer:latest"
}
