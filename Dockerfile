FROM alpine:3.20
LABEL org.opencontainers.image.title="d-stakeholder"
LABEL org.opencontainers.image.description="Scaffold-only placeholder container for d-stakeholder"
CMD ["sh", "-lc", "echo 'd-stakeholder scaffold-only baseline';"]
