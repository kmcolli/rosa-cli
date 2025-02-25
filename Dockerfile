FROM registry.access.redhat.com/ubi9/ubi-minimal

# Set environment variables
ENV PATH="/usr/local/bin:$PATH" \
    HOME="/tmp"

# Install curl by extracting it from the full UBI image
COPY --from=registry.access.redhat.com/ubi9/ubi /tmp /tmp
RUN curl -Lo /usr/local/bin/rosa https://mirror.openshift.com/pub/openshift-v4/clients/rosa/latest/rosa-linux && \
    chmod +x /usr/local/bin/rosa && \
    rm -rf /tmp/*

# Create non-root user (OpenShift best practice)
RUN useradd -u 1001 rosa-user && \
    mkdir -p /home/rosa-user && \
    chown -R 1001:1001 /home/rosa-user /usr/local/bin/rosa

# Switch to non-root user
USER 1001

# Set working directory
WORKDIR /home/rosa-user

# Default command
ENTRYPOINT ["/usr/local/bin/rosa"]