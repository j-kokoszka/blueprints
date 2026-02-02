FROM alpine:3.22.2

# Install required packages
RUN apk update && apk add --no-cache curl bind-tools \ 
    python3 py3-pip rsync sudo bash ansible \
    openssh git ca-certificates glab 

# Install OpenTofu
RUN curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh \
    && chmod +x install-opentofu.sh \
    && ./install-opentofu.sh --install-method apk \
    && rm -f install-opentofu.sh

# Install SOPS
RUN curl -LO https://github.com/getsops/sops/releases/download/v3.10.1/sops-v3.10.1.linux.amd64 \
    && mv sops-v3.10.1.linux.amd64 /usr/local/bin/sops \
    && chmod +x /usr/local/bin/sops

# Install kubectl 
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install flux
RUN curl -s https://fluxcd.io/install.sh | sudo bash

CMD ["sh"]
