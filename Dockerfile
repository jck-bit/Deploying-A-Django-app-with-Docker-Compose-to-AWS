FROM python:3

ENV PYTHONUNBUFFERED = 1
WORKDIR /code
COPY requirements.txt /code/

RUN pip install -r requirements.txt && \
    adduser --disabled-password --no-create-home app && \
    mkdir -p /vol/web/static && \
    mkdir -p /vol/web/media && \
    chown -R app:app /vol && \
    chmod -R 755 /vol 
USER app

COPY . /code/