FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

ENV MODEL_PATH /opt/ml/model

EXPOSE 8080

ENTRYPOINT ["mlflow", "models", "serve", "-m", "${MODEL_PATH}", "--host", "0.0.0.0", "--port", "8080", "--env-manager", "local"]