terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "app_net" {
  name = "devops_app_network"

  check_duplicate = true
}

resource "docker_image" "user_image" {
  name = "localhost:5001/user-service:latest"
}

resource "docker_image" "order_image" {
  name = "localhost:5001/order-service:latest"
}

resource "docker_container" "user_service" {
  name  = "user-service"
  image = docker_image.user_image.name

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 5000
    external = 5000
  }
}

resource "docker_container" "order_service" {
  name  = "order-service"
  image = docker_image.order_image.name

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 4000
    external = 4000
  }
}
