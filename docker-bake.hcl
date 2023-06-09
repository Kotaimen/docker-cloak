variable "CLOAK_VERSION" {
   default = "2.7.0"
}

group "default" {
   targets = [
      "cloak"
   ]
}

target "cloak" {
   context = "cloak"
   dockerfile = "Dockerfile"
   args = {
      CLOAK_VERSION = "${CLOAK_VERSION}"
   }
   platforms = [
      "linux/amd64",
      "linux/arm64",
      "linux/arm/v7"
   ]
   tags = [
      "docker.io/kotaimen/cloak:${CLOAK_VERSION}",
   ]
}
