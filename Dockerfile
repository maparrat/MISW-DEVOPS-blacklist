FROM public.ecr.aws/docker/library/python:3.10-alpine

WORKDIR /app
COPY . /app/

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["newrelic-admin", "run-program", "python3", "src/application.py"]