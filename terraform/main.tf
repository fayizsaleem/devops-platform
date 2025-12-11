terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {}

########################################
# 🔹 NETWORK (Creates only if missing)
########################################

resource "docker_network" "app_net" {
  name   = "devops_app_network"
  driver = "bridge"
}


########################################
# 🔹 USER SERVICE CONTAINER (Python)
########################################

resource "docker_container" "user_service" {
  name  = "user-service"
  image = "localhost:5001/user-service:latest"
  restart = "always"

  ports {
    internal = 5000
    external = 5000
  }

  networks_advanced {
    name = "devops_app_network"
  }
}

########################################
# 🔹 ORDER SERVICE CONTAINER (NodeJS)
########################################

resource "docker_container" "order_service" {
  name  = "order-service"
  image = "localhost:5001/order-service:latest"
  restart = "always"

  ports {
    internal = 4000
    external = 4000
  }

  networks_advanced {
    name = "devops_app_network"
  }
}
