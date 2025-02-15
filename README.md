# DevOps Technical Assessment 

## Overview
This project implements a containerized web application with frontend and backend services, including monitoring capabilities using Prometheus and Grafana.

## Architecture
- Frontend: React application serving a simple UI
- Backend: Python using Flask framework
- Monitoring: Prometheus for metrics collection and Grafana for visualization
- All services are containerized using Docker and orchestrated with Docker Compose

## Requirements
- Docker
- Docker Compose
- Python3
- Node.js 16+ (for local development)
- npm 

## Setup Instructions

1. Clone the repository
```bash
git clone <repository-url>
cd <project-directory>
```

2. Start the application
```bash
./build.sh up docker-compose.yaml
```

3. Access the services:
- Frontend: http://localhost:3000
- Backend: http://localhost:5000
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3001

## Local Development

1. Frontend Development
```bash
cd frontend
npm install
npm start
```

2. Backend Development
```bash
cd backend
python app.py
```

## Monitoring Setup

### Available Metrics
- HTTP request duration
- Total request count
- Error count

### Grafana Dashboard Setup
1. Login to Grafana (http://localhost:3000)
   - Username: admin
   - Password: admin
2. Go to dashboard "backend_metrics"


## Troubleshooting

### Common Issues

1. Services not starting
- Check if ports are already in use
- Verify Docker daemon is running
- Check container logs: `docker-compose logs <service-name>`

2. Frontend can't connect to backend
- Verify backend is running: `curl http://localhost:5000/api/message`
- Check network configuration in docker-compose.yml

3. Monitoring issues
- Verify Prometheus targets are up: http://localhost:9090/targets
- Check Prometheus logs: `docker-compose logs prometheus`
- Verify Grafana can connect to Prometheus data source

### Solutions

1. Port conflicts
```bash
# Check for processes using the ports
sudo lsof -i :3000
sudo lsof -i :5000
# Stop the conflicting processes or modify the port mapping in docker-compose.yml
```

2. Container issues
```bash
# Remove all containers and volumes
./build clean docker-compose.yaml
# Rebuild and start
./build build docker-compose.yaml
```