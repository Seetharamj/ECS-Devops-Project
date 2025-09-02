FROM python:3.11-slim
WORKDIR /app


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY app/src/ ./src
COPY app/tests/ ./tests


WORKDIR /app/src

EXPOSE 8080
CMD ["python", "server.py"]
