FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your application code
COPY src/ ./src
COPY app/ ./app
COPY tests/ ./tests

# Set Python path
ENV PYTHONPATH=/app/src

EXPOSE 8080

# Run the app
CMD ["python", "src/server.py"]
