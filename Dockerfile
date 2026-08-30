FROM ubuntu:26.04 AS build
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential ca-certificates dub ldc \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY dub.json ./
COPY source ./source
RUN dub build --compiler=ldc2 --build=release

FROM ubuntu:26.04
LABEL org.opencontainers.image.title="d-stakeholder"
LABEL org.opencontainers.image.description="D deterministic-first stakeholder CLI rewrite"
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates ldc \
    && rm -rf /var/lib/apt/lists/*
COPY --from=build /app/bin/d-stakeholder /usr/local/bin/d-stakeholder
ENTRYPOINT ["/usr/local/bin/d-stakeholder"]
CMD ["--list-values"]
