terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}



resource "docker_image" "quiz_app" {
  name = "quiz-app:latest"

  build {
    context    = "${path.module}/k8s-quiz"
    dockerfile = "Dockerfile"
  }

  triggers = {
    app_code = filesha256("${path.module}/../k8s-quiz/app.py")
  }
  keep_locally = false
}


## running docker
resource "docker_container" "quiz_app" {
  name  = "quiz_app"
  image = docker_image.quiz_app.image_id

  ports {
    internal = 5000
    external = 5000
  }

  lifecycle {
    replace_triggered_by = [docker_image.quiz_app]
    create_before_destroy  = false   # destroy old before creating new
  }
}


variable "app_port" {
  description = "Port to expose quiz app"
  type        = number
  default     = 5000
}



data "external" "host_ip" {
  program = ["${path.module}/get_ip.sh"]
}

