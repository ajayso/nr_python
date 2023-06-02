FROM durepo.azurecr.io/dataunifierapiengine:version1.2.1
COPY /code/. /code
EXPOSE 5000
WORKDIR /code
RUN pip install newrelic
# override with '-e', license key mandatory
ENV NEW_RELIC_APP_NAME="BasicOne"
ENV NEW_RELIC_LOG=stdout
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true
ENV NEW_RELIC_LICENSE_KEY=8dc71fbcc1f2d4d5f34470e7ca1b76c8b843NRAL
ENV NEW_RELIC_LOG_LEVEL=info

CMD ["newrelic-admin","run-python", "app.py"]