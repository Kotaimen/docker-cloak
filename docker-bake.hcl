group "default" {
	targets = ["v2fly", "cloak"]
}

target "v2fly" {
   context = "v2fly"
   dockerfile = "Dockerfile"
   platforms = [
      "linux/amd64",
      "linux/arm64",
      "linux/arm/v7"
   ]
   tags = [
      "docker.io/kotaimen/v2fly:v4",
   ]
}

target "cloak" {
   context = "cloak"
   dockerfile = "Dockerfile"
   args = {
      CLOAK_VERSION = "2.6.1"
   }
   platforms = [
      "linux/amd64",
      "linux/arm64",
      "linux/arm/v7"
   ]
   tags = [
      "docker.io/kotaimen/cloak:v2",
   ]
}
