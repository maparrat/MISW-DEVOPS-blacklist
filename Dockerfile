FROM public.ecr.aws/docker/library/python:3.10-alpine

WORKDIR /app
COPY . /app/

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

ENV NEW_RELIC_APP_NAME="Blaclist_App"
ENV NEW_RELIC_LOG=stdout
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true
#INGEST_License
ENV NEW_RELIC_LICENSE_KEY=b68ea0c31de4ef2e22ba325c1a2fc2edFFFFNRAL
ENV NEW_RELIC_LOG_LEVEL=info

CMD ["newrelic-admin", "run-program", "python3", "src/application.py"]