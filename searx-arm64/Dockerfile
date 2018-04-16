FROM arm64v8/python:3

WORKDIR /usr/src/app
EXPOSE 8888

RUN pip install --no-cache-dir searx==0.14.0 requests pyyaml pygments flask flask-babel lxml python-dateutil pyopenssl
RUN sed -i "s/127.0.0.1/0.0.0.0/g" /usr/local/lib/python3.6/site-packages/searx/settings.yml

#For scaleway only
#ENV http_proxy "http://10.10.46.163:8888"
#ENV https_proxy "http://10.10.46.163:8888"

CMD [ "python3", "/usr/local/lib/python3.6/site-packages/searx/webapp.py" ]

