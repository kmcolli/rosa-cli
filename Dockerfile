FROM registry.access.redhat.com/ubi9/ubi-minimal

# Set environment variables
ENV PATH="/usr/local/bin:$PATH"

# Install curl and download the ROSA CLI
COPY --from=registry.access.redhat.com/ubi9/ubi /tmp /tmp
RUN cp /tmp/usr/bin/curl /usr/bin/curl && \
    curl -Lo /usr/local/bin/rosa https://mirror.openshift.com/pub/openshift-v4/clients/rosa/latest/rosa-linux && \
    chmod +x /usr/local/bin/rosa && \
    rm -rf /tmp/*

# Set entrypoint to rosa CLI
ENTRYPOINT ["/usr/local/bin/rosa"]