FROM python:3.11-slim
WORKDIR /app

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/src/ ./src
COPY app/server.py .

ENV PYTHONPATH=/app/src
EXPOSE 8080
CMD ["python", "server.py"]
