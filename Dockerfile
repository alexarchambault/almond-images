FROM alexarchambault/almond-test:coursier

USER $NB_UID

ENV SCALA_VERSION 2.11.12
ENV ALMOND_VERSION 0.1.7

RUN coursier bootstrap \
      -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
      sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
      -o almond && \
    ./almond --install && \
    rm almond
