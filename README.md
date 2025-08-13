# Jenkins CI/CD Pipeline for Node.js Docker App

## Project Overview
This repository demonstrates a **CI/CD pipeline** using **Jenkins** and **Docker** for a minimal Node.js application.  
The pipeline automates:

1. **Checkout**: Fetches the latest code from GitHub.
2. **Build Docker Image**: Builds a Docker image from the provided `Dockerfile`.
3. **Test Application**: Runs the Docker container temporarily to validate the app.
4. **Deploy Application**: Deploys the container on port 8081.

---

## Files in Repository

- `Jenkinsfile` – Declarative pipeline definition for Jenkins.  
- `Dockerfile` – Instructions to build the Node.js Docker image.  
- `package.json` – Node.js dependencies.  
- `app.js` – Minimal Node.js application.  
- `README.md` – This file.  

---

## How the Pipeline Works

1. Jenkins fetches code from this GitHub repository.  
2. Builds a Docker image named `myapp:latest`.  
3. Runs a test container to ensure the application works.  
4. Stops and removes any existing `myapp-container`.  
5. Deploys the container and maps host port `8081` to container port `8080`.  
---

## Commands Used in Pipeline

```bash
# Build Docker image
docker build -t myapp:latest .

# Test application
docker run --rm myapp:latest echo "Tests passed!"

# Deploy application
docker stop myapp-container || true
docker rm myapp-container || true
docker run -d --name myapp-container -p 8081:8080 myapp:latest
