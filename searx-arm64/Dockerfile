FROM arm64v8/python:3.8

WORKDIR /usr/src/app
EXPOSE 8888

RUN pip install --no-cache-dir searx==0.16.0 requests pyyaml pygments flask flask-babel lxml python-dateutil pyopenssl
RUN useradd searx
ENV SEARX_BIND_ADDRESS 0.0.0.0

USER searx

CMD [ "python3", "/usr/local/lib/python3.8/site-packages/searx/webapp.py" ]

