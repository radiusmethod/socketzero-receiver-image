ARG BASE_REGISTRY=registry1.dso.mil
ARG BASE_IMAGE=ironbank/google/golang/ubi9/golang-1.21
ARG BASE_TAG=1.21.7

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

USER root

RUN microdnf update -y --nodocs && \
    microdnf clean all && \
    rm -rf /var/cache/microdnf

USER nobody

COPY --chown=nobody:nobody --chmod=700 socketzero-receiver /opt/socketzero-receiver

WORKDIR /opt

ENTRYPOINT ["/opt/socketzero-receiver"]
