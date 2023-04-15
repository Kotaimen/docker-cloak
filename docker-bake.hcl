group "default" {
	targets = ["v2fly", "cloak"]
}

target "v2fly" {
   context = "v2fly"
   dockerfile = "Dockerfile"
   platforms = [
      "linux/amd64",
      "linux/arm64",
      "linux/arm/v6",
      "linux/arm/v7"
   ]
   tags = [
      // "docker.io/kotaimen/v2fly:4",
      "777337120655.dkr.ecr.cn-north-1.amazonaws.com.cn/cyril-playground:v2fly"
   ]
}

target "cloak" {
   context = "cloak"
   dockerfile = "Dockerfile"
   platforms = [
      "linux/amd64",
      "linux/arm64",
      "linux/arm/v6",
      "linux/arm/v7"
   ]
   tags = [
      // "docker.io/kotaimen/cloak:2"
      "777337120655.dkr.ecr.cn-north-1.amazonaws.com.cn/cyril-playground:cloak"
   ]
}
