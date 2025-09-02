FROM python:3.11-slim
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ ./src
COPY tests/ ./tests
COPY server.py .

ENV PYTHONPATH=/app/src
EXPOSE 8080
CMD ["python", "src/server.py"]
