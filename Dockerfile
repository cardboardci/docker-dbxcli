FROM cardboardci/ci-core@sha256:5b93f4c8cc1ddaa809f9c27d0a865a974ccb43e5e3d38334df1b0d77ea1843fb
USER root

ARG DEBIAN_FRONTEND=noninteractive

COPY rootfs/ /

ARG VERSION=3.0.0
ADD https://github.com/dropbox/dbxcli/releases/download/v${VERSION}/dbxcli-linux-amd64 /usr/local/bin/dbxcli
RUN chmod +x /usr/local/bin/dbxcli

USER cardboardci

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer="CardboardCI"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="dbxcli"
LABEL org.label-schema.version="${version}"
LABEL org.label-schema.build-date="${build_date}"
LABEL org.label-schema.release="CardboardCI version:${version} build-date:${build_date}"
LABEL org.label-schema.vendor="cardboardci"
LABEL org.label-schema.architecture="amd64"
LABEL org.label-schema.summary="Dropbox CLI"
LABEL org.label-schema.description="A command line client for Dropbox built using the Go SDK."
LABEL org.label-schema.url="https://gitlab.com/cardboardci/images/dbxcli"
LABEL org.label-schema.changelog-url="https://gitlab.com/cardboardci/images/dbxcli/releases"
LABEL org.label-schema.authoritative-source-url="https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/dbxcli"
LABEL org.label-schema.distribution-scope="public"
LABEL org.label-schema.vcs-type="git"
LABEL org.label-schema.vcs-url="https://gitlab.com/cardboardci/images/dbxcli"
LABEL org.label-schema.vcs-ref="${vcs_ref}"