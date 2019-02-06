FROM jupyter/minimal-notebook

USER root

RUN apt-get -y update && \
    apt-get install --no-install-recommends -y \
      curl \
      openjdk-8-jre-headless \
      ca-certificates-java && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -Lo /usr/local/bin/coursier https://git.io/coursier-cli && \
    chmod +x /usr/local/bin/coursier

USER $NB_UID

# ensure the JAR of the CLI is in the coursier cache, in the image
RUN /usr/local/bin/coursier --help
