FROM arm64v8/python:3

WORKDIR /usr/src/app
EXPOSE 8888

RUN pip install --no-cache-dir searx==0.15.0 requests pyyaml pygments flask flask-babel lxml python-dateutil pyopenssl
RUN sed -i "s/127.0.0.1/0.0.0.0/g" /usr/local/lib/python3.7/site-packages/searx/settings.yml

CMD [ "python3", "/usr/local/lib/python3.7/site-packages/searx/webapp.py" ]

