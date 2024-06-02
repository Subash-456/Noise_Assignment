# DevOps Assignment: Managing Containerized Applications with Kubernetes, AWS ECR, and CI/CD

This repository contains the solution for a DevOps assignment focused on setting up a simple microservices architecture using Kubernetes, AWS Elastic Container Registry (ECR), and CI/CD pipelines.

## Objectives

1. **Kubernetes Cluster Configuration:**
    - A Kubernetes configuration file (`cluster.yaml`) is provided to initialize the cluster.
    - Instructions on deploying and verifying the deployment of the cluster.

2. **Docker and ECR Setup:**
    - A Dockerfile for a simple web service (e.g., a static HTML page served by Nginx) is included.
    - Steps to build the Docker image and push it to AWS ECR, along with ECR repository setup.

3. **Ingress Configuration:**
    - An Ingress Controller (Nginx) is set up to route external traffic.
    - An ingress configuration file (`ingress.yaml`) routes traffic to the web service based on URL path.

4. **CI/CD Pipeline:**
    - A pipeline using GitHub Actions automates:
        - Building the Docker image.
        - Pushing it to ECR.
        - Deploying the image to the Kubernetes cluster.

## Installation and Setup

### Prerequisites

Before starting, ensure you have the following installed:
- Docker
- Minikube
- kubectl
- AWS CLI
- GitHub account

### Setting up the Kubernetes Cluster

1. Clone this repository.
2. Navigate to the `kubernetes/` directory.
3. Run the following command to initialize the Kubernetes cluster using Minikube:
