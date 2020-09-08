FROM dataiku/dss:7.0.2

USER root

RUN /home/dataiku/dataiku-dss-$DSS_VERSION/scripts/install/install-deps.sh -yes -without-java -without-python -with-r -with-conda

# Remove hardcoding of empty license file path in order to supply with location the license file
RUN sed -i '/LICENSE=/d' /home/dataiku/dataiku-dss-$DSS_VERSION/installer.sh

# Create required tmp run folder or dataiku will fail
RUN mkdir -p /tmp/run && chown dataiku /tmp/run -R

ADD config/install.ini /
ADD scripts/startup.sh /
RUN echo "/startup.sh" >> /home/dataiku/dataiku-dss-$DSS_VERSION/installer.sh
USER dataiku
