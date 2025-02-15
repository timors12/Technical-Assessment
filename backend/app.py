from flask import Flask, jsonify
from flask_cors import CORS
from prometheus_client import Counter, Gauge, Histogram, generate_latest
import time

app = Flask(__name__)
CORS(app)

# Prometheus metrics
REQUEST_COUNT = Counter('request_count', 'Total number of requests')
REQUEST_LATENCY = Histogram('request_latency_seconds', 'Request latency in seconds')
ERROR_COUNT = Counter('error_count', 'Total number of errors')

@app.route('/api/message')
@REQUEST_LATENCY.time()  # Track latency for this route
def message():
    REQUEST_COUNT.inc()  # Increment the request count

    try:
        return jsonify({"message": "helloworld from Backend"})
    except Exception as e:
        ERROR_COUNT.inc()  # Increment error count in case of an error
        return jsonify({"error": str(e)}), 500

@app.route('/metrics')
def metrics():
    # Expose the metrics for Prometheus to scrape
    return generate_latest(), 200, {'Content-Type': 'text/plain; version=0.0.4'}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)