FROM public.ecr.aws/docker/library/golang:1.17-alpine AS build

ARG CLOAK_VERSION=2.6.1

WORKDIR /build

# ENV HTTPS_PROXY http://10.90.1.52:3129

RUN apk add --no-cache git
RUN git clone --depth 1 --branch v${CLOAK_VERSION} https://github.com/cbeuw/Cloak.git

WORKDIR /build/Cloak

RUN go get ./...

RUN mkdir -p build_assets && \
  go build -ldflags "-X main.version=${CLOAK_VERSION}" ./cmd/ck-client && \
  go build -ldflags "-X main.version=${CLOAK_VERSION}" ./cmd/ck-server 


FROM public.ecr.aws/docker/library/alpine:3

COPY --from=build /build/Cloak/ck-server /bin/
COPY --from=build /build/Cloak/ck-client /bin/
COPY --from=build /build/Cloak/example_config/ckclient.json /etc/cloak/ckclient.json
COPY --from=build /build/Cloak/example_config/ckserver.json /etc/cloak/ckserver.json

ENTRYPOINT [ "ck-client", "-c", "/etc/cloak/ckclient.json", "-i", "0.0.0.0", "-l", "1984"]
