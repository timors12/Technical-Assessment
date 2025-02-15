# Use a lightweight Python image as the builder
FROM python:3.11-slim AS builder

# Set a non-root user for security
RUN useradd -m appuser
WORKDIR /app

# Copy only necessary files to optimize caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Use a smaller base image for the final stage
FROM python:3.11-alpine

# Set a non-root user
RUN adduser -D appuser
USER appuser

# Set work directory
WORKDIR /app

# Copy installed dependencies from the builder stage
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages

# Copy application files
COPY app.py ./

# Expose port
EXPOSE 5000
EXPOSE 9090

# Start the app
CMD ["python", "/app/app.py"]

