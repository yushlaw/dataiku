FROM dataiku/dss

USER root

RUN apt-get update && apt-get install -y gnupg libasound2

RUN echo Installing vim and other tools for troubleshooting && \
    echo Remove when finalized for production && \
    apt-get install -y vim

RUN /home/dataiku/dataiku-dss-$DSS_VERSION/scripts/install/install-deps.sh -yes -without-java -without-python -with-r -with-conda

# Remove hardcoding of empty license file path in order to supply with location the license file
RUN sed -i '/LICENSE=/d' /home/dataiku/dataiku-dss-$DSS_VERSION/installer.sh

RUN mkdir -p /tmp/run && chown dataiku /tmp/run -R

ADD config/install.ini /
ADD scripts/startup.sh /
RUN echo "/startup.sh" >> /home/dataiku/dataiku-dss-$DSS_VERSION/installer.sh
USER dataiku
