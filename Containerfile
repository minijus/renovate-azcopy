LABEL version = "0.0.7"

# renovate: datasource=custom.azcopy depName=azcopy
ENV AZCOPY_VERSION=10.22.1
ENV AZCOPY_VERSION_DATE=20231220

# Install azcopy
RUN curl -sSL https://azcopyvnext.azureedge.net/releases/release-${AZCOPY_VERSION}-${AZCOPY_VERSION_DATE}/azcopy_linux_amd64_$AZCOPY_VERSION.tar.gz -o azcopy.tar.gz \
    && tar -xf azcopy.tar.gz --strip-components=1 \
    && mv ./azcopy /usr/local/bin/ \
    && chmod +x /usr/local/bin/azcopy \
    && rm azcopy.tar.gz