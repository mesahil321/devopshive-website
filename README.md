# DevOpsHive - CloudSprint Client Deployment
## 1. Introduction
This repository contains all the infrastructure-as-code and automation scripts to deliver a scalable, secure, and highly available website backend for CloudSprint’s new client.
The primary goal of this project is to build a complete CI/CD pipeline that automates the deployment of a containerized, auto-scaling website on AWS, following modern DevOps best practices.

## 2. Technology Stack
This project will utilize the following technologies to meet the client's requirements:

| Category | Technology | Purpose |
| :--- | :--- | :--- |
| **Cloud Provider** | Amazon Web Services (AWS) | To host all infrastructure resources. |
| **Infrastructure as Code** | Terraform | To provision and manage all AWS resources, including the EKS cluster. |
| **Containerization** | Docker | To package the website into a portable and consistent container image. |
| **Container Orchestration**| Kubernetes (AWS EKS) | To automate the deployment, scaling, and management of the containerized application. |
| **Configuration Mgmt** | Ansible | To perform initial setup or configuration on cluster nodes if needed. |
| **CI/CD Orchestration** | Jenkins | To automate the build, test, and deployment pipeline. |
| **Version Control** | Git / GitHub | To store and manage all code for the project. |

## 3. Project Structure
The repository is organized into the following directories to separate concerns:

* `infrastructure/` - Contains all infrastructure definitions.
    * `terraform/` - Terraform code for AWS resources (like the EKS cluster).
    * `ansible/` - Ansible playbooks (could be used for initial node setup).
* `ci-cd/` - CI/CD pipeline configurations.
    * `jenkins/` - `Jenkinsfile` for pipeline orchestration.
* `wordpress/` - Application-specific files (simple dummy site).
    * `docker/` - `Dockerfile` to build the application container.
* `kubernetes/` - Kubernetes configuration files.
    * `manifests/` - YAML files for Deployments, Services, Ingress, etc.
* `docs/` - Project documentation and diagrams.

## 4. Getting Started
To begin working on the project, clone the repository to your local machine:
```bash
git clone https://github.com/DarkSim-source/DevOpsHive.git
