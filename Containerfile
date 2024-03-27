LABEL version = "0.0.7"

# renovate: datasource=custom.kubernetes depName=kubernetes
ENV KUBERNETES_VERSION=1.0.0

# renovate: datasource=custom.azcopy depName=azcopy
ENV AZCOPY_VERSION=10.24.0
ENV AZCOPY_VERSION_DATE=20231220

# Install azcopy
RUN curl -sSL https://azcopyvnext.azureedge.net/releases/release-${AZCOPY_VERSION}-${AZCOPY_VERSION_DATE}/azcopy_linux_amd64_$AZCOPY_VERSION.tar.gz -o azcopy.tar.gz \
    && tar -xf azcopy.tar.gz --strip-components=1 \
    && mv ./azcopy /usr/local/bin/ \
    && chmod +x /usr/local/bin/azcopy \
    && rm azcopy.tar.gz

RUN echo "Downloading Kubernetes Client (kubectl) v$KUBERNETES_VERSION" \
    && curl -sSLO "https://dl.k8s.io/release/v$KUBERNETES_VERSION/bin/linux/amd64/kubectl" \
    && curl -sSLO "https://dl.k8s.io/release/v$KUBERNETES_VERSION/bin/linux/amd64/kubectl.sha256" \
    \
    && echo "Installing Kubernetes Client" \
    && chmod +x kubectl \
    && mv kubectl /usr/bin/kubectl \
    && kubectl version --client \
    && rm kubectl.sha256