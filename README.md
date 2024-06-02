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
![Screenshot 2024-05-31 225201](https://github.com/Subash-456/Noise_Assignment/assets/126191558/59415c39-2087-4eb8-bb47-5bf185527781)

2. **Initialize Cluster:**
    - Create `cluster.yaml` file.
    - Deploy cluster using:
        ```
        kubectl apply -f cluster.yaml
        ```
![Screenshot 2024-06-02 120519](https://github.com/Subash-456/Noise_Assignment/assets/126191558/8b3b6f2d-7d20-4c85-b13d-1472efd3fbc3)


### Docker and ECR Setup

1. **Create Docker Image:**
    - Build the Docker image for the web service.
    - Commands used:
        ```
        docker build -t web-service .
        ```
![Screenshot 2024-06-02 120707](https://github.com/Subash-456/Noise_Assignment/assets/126191558/f024a104-1ea4-4849-952c-725dc7f540c8)

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
![Screenshot 2024-06-01 142124](https://github.com/Subash-456/Noise_Assignment/assets/126191558/ff5223eb-a849-4cac-98cb-95bfca314889)


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
![Screenshot 2024-06-02 121036](https://github.com/Subash-456/Noise_Assignment/assets/126191558/5ffc75bd-ddfa-40b0-af9c-727e05653fca)


3. **Access Your Web Application:**
    - Open your web browser and go to http://subashnoise.com. You should see your web application being served.
![Screenshot 2024-06-02 121227](https://github.com/Subash-456/Noise_Assignment/assets/126191558/437f67bb-c35b-4430-a580-7afffa6f2457)




### CI/CD Pipeline

1. **GitHub Actions Pipeline:**
    - Set up a pipeline using GitHub Actions.
    - Pipeline configuration is defined in `pipeline.yaml`.

## Repository Structure
![Screenshot 2024-06-02 114815](https://github.com/Subash-456/Noise_Assignment/assets/126191558/6e76d01f-5587-476d-b8ad-ffcb81a103e8)

## Conclusion

This DevOps assignment provided an opportunity to gain practical experience in managing containerized applications using Kubernetes, AWS ECR, and CI/CD pipelines. By completing the objectives outlined in this assignment, I have successfully set up a microservices architecture, configured Kubernetes clusters, established Docker and ECR workflows, configured Ingress for managing external traffic, and implemented a CI/CD pipeline for continuous deployment using GitHub Actions.

Through this assignment, I have demonstrated proficiency in key DevOps practices such as infrastructure automation, containerization, and continuous integration/continuous deployment. The completion of this assignment not only showcases my technical skills but also my ability to document and communicate the implementation process effectively.

I welcome any feedback and suggestions for improvement. Contributions from the community are also encouraged to enhance the robustness and usability of this solution.

Thank you for reviewing my DevOps assignment!

