# DevOpsHive - CloudSprint Client Deployment
## 1. Introduction
This repository contains all the infrastructure-as-code and automation scripts to deliver a scalable, secure, and highly available website backend for CloudSprint’s new client.
The primary goal of this project is to build a complete CI/CD pipeline that automates the deployment of a containerized, auto-scaling website on AWS, following modern DevOps best practices.

## 2. Technology Stack
This project will utilize the following technologies to meet the client's requirements:
| Category | Technology | Purpose |
| :--- | :--- | :--- |
| **Cloud Provider** | Amazon Web Services (AWS) | To host all infrastructure resources. |
| **Infrastructure as Code** | Terraform | To provision and manage all AWS resources. |
| **Containerization** | Docker | To package the website into a portable and consistent unit. |
| **Configuration Mgmt** | Ansible | To automate the deployment of the Docker container to servers. |
| **CI/CD Orchestration** | Jenkins | To automate the build, test, and deployment pipeline. |
| **Version Control** | Git / GitHub | To store and manage all code for the project. |

## 3. Project Structure
The repository is organized into the following directories to separate concerns:

infrastructure/     # Contains all infrastructure definitions
terraform/      # Terraform code for AWS resources
ansible/        # Ansible playbooks for deployment
ci-cd/              # CI/CD pipeline configurations
  ci-cd/jenkins/        # Jenkinsfile for pipeline orchestration
wordpress/          # Application-specific files (will be a simple dummy site)
  wordpress/docker/         # Dockerfile to build the application container
docs/               # Project documentation and diagrams

## 4. Getting Started
To begin working on the project, clone the repository to your local machine:
```bash
git clone [https://github.com/DarkSim-source/DevOpsHive.git](https://github.com/DarkSim-source/DevOpsHive.git)
