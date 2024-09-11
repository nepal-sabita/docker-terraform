terraform{
  required_providers{
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "mydeployment"{
  name = "mydeployment"
  build {
    context = "./"
    dockerfile = "Dockerfile"
  }
}
resource "docker_container" "my_deploy_container" {
  name  = "my_deploy_container"
  image = docker_image.mydeployment.name
  ports {
    internal = 3000
    external = 3000
  }
}