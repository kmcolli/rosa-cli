FROM registry.access.redhat.com/ubi9/ubi-minimal

# Set environment variables
ENV PATH="/usr/local/bin:$PATH"

# Install necessary packages
RUN curl -Lo /usr/local/bin/rosa https://mirror.openshift.com/pub/openshift-v4/clients/rosa/latest/rosa-linux && \
    chmod +x /usr/local/bin/rosa && \

# Set entrypoint to rosa CLI
ENTRYPOINT ["/usr/local/bin/rosa"]