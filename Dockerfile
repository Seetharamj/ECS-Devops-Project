FROM python:3.11-slim

WORKDIR /app


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ ./src
COPY app/ ./app
COPY tests/ ./tests


ENV PYTHONPATH=/app/src

EXPOSE 8080

CMD ["python", "src/server.py"]
