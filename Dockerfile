FROM argoproj/argocd:v2.5.4

USER root
RUN apt-get update && \
    apt-get install -y \
        curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER 999

RUN helm plugin install --version "main" https://github.com/Noksa/helm-resolve-deps.git

ENV HELM_PLUGINS="/home/argocd/.local/share/helm/plugins/"
