FROM jenkins/jenkins:lts-jdk17

USER root

# Install required tools
RUN apt-get update && apt-get install -y \
    git curl lsb-release ca-certificates gnupg \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Install Docker CLI
# Install Docker CLI (stable version)
RUN apt-get update && apt-get install -y docker.io && rm -rf /var/lib/apt/lists/*

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/v1.29.0/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && rm kubectl

# Fix Docker permission
RUN groupadd -g 999 docker || true && usermod -aG docker jenkins

USER jenkins

RUN jenkins-plugin-cli --plugins \
    "blueocean docker-workflow kubernetes git pipeline-stage-view"