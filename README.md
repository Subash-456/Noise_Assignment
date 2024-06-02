# DevOps Assignment: Managing Containerized Applications with Kubernetes, AWS ECR, and CI/CD

This repository contains the solution for a DevOps assignment focused on managing containerized applications using Kubernetes, AWS Elastic Container Registry (ECR), and CI/CD pipelines.

## Objectives

1. **Kubernetes Cluster Configuration:**
    - A Kubernetes configuration file (`cluster.yaml`) that initializes a cluster (can be simulated with Minikube if done locally).
    - Deployment verification instructions.

2. **Docker and ECR Setup:**
    - Dockerfile creation for a simple web service (e.g., a static HTML page served by Nginx).
    - Documentation of steps to build the Docker image and push it to AWS ECR, including ECR repository setup.

3. **Ingress Configuration:**
    - Setting up an Ingress Controller (Nginx) to route external traffic.
    - Providing an ingress configuration file (`ingress.yaml`) that routes traffic to the web service based on URL path.
    - Including test URLs and expected responses.

4. **CI/CD Pipeline:**
    - Setting up a pipeline using GitHub Actions that automates:
        - Building the Docker image.
        - Pushing it to ECR.
        - Deploying the image to the Kubernetes cluster.
    - Providing the pipeline configuration file (`pipeline.yaml`) and a step-by-step guide on how the pipeline works.

## Implementation Details

### Kubernetes Cluster Configuration

1. **Setup Minikube:**
    - Install Docker, Minikube, and kubectl.
    - Commands used:
        ```
        sudo apt update -y
        sudo apt install docker.io -y
        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
        sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
        wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
        sudo cp minikube-linux-amd64 /usr/local/bin/minikube
        ```
2. **Initialize Cluster:**
    - Create `cluster.yaml` file.
    - Deploy cluster using:
        ```
        kubectl apply -f cluster.yaml
        ```

### Docker and ECR Setup

1. **Create Docker Image:**
    - Build the Docker image for the web service.
    - Commands used:
        ```
        docker build -t web-service .
        ```
2. **Push Image to AWS ECR:**
    - Create ECR repository:
        ```
        aws ecr create-repository --repository-name web-service --region us-west-2
        ```
    - Authenticate Docker to ECR and push image:
        ```
        aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.us-west-2.amazonaws.com
        docker tag web-service:latest <aws_account_id>.dkr.ecr.us-west-2.amazonaws.com/web-service:latest
        docker push <aws_account_id>.dkr.ecr.us-west-2.amazonaws.com/web-service:latest
        ```

### Ingress Configuration

1. **Set up Nginx Ingress Controller:**
    - Apply Ingress Controller:
        ```
        kubectl apply -f ingress.yaml
        ```

2. **Verify the Ingress Controller is Running:**
    - Ensure the Ingress Controller is running:
        ```
        kubectl get pods -n kube-system | grep ingress
        ```

3. **Access Your Web Application:**
    - Open your web browser and go to http://subashnoise.com. You should see your web application being served.



### CI/CD Pipeline

1. **GitHub Actions Pipeline:**
    - Set up a pipeline using GitHub Actions.
    - Pipeline configuration is defined in `pipeline.yaml`.

## Repository Structure
![Screenshot 2024-06-02 114815](https://github.com/Subash-456/Noise_Assignment/assets/126191558/6e76d01f-5587-476d-b8ad-ffcb81a103e8)
