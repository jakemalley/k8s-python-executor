FROM python:3.7-alpine

# Create a working directory.
RUN mkdir -p /opt
RUN mkdir -p /opt/scripts
WORKDIR /opt

RUN \
 apk update && \
 python3 -m pip install --upgrade pip --no-cache-dir && \
 python3 -m pip install requests --no-cache-dir

COPY entrypoint.sh /opt/entrypoint.sh

ENTRYPOINT [ "/bin/sh" ]
CMD [ "/opt/entrypoint.sh", "/opt/scripts" ]
