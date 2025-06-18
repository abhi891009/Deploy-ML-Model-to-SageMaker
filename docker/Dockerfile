FROM python:3.9-slim

RUN pip install mlflow scikit-learn pandas

COPY ../model /app/model
WORKDIR /app

ENTRYPOINT ["mlflow", "models", "serve", "-m", "model", "-p", "5000"]