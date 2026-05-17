FROM dlang2/ldc-ubuntu:latest AS build
WORKDIR /app
COPY dub.json ./
COPY source ./source
RUN dub build --compiler=ldc2 --build=release

FROM ubuntu:24.04
LABEL org.opencontainers.image.title="d-stakeholder"
LABEL org.opencontainers.image.description="D deterministic-first stakeholder CLI rewrite"
COPY --from=build /app/bin/d-stakeholder /usr/local/bin/d-stakeholder
ENTRYPOINT ["/usr/local/bin/d-stakeholder"]
CMD ["--list-values"]
