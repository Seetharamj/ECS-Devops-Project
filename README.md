# 🚀 Advanced DevOps Project: Jenkins + Terraform + Docker + ECS Fargate (Blue-Green Deployment)

This project demonstrates an end-to-end DevOps pipeline for deploying a containerized Flask application on AWS ECS Fargate using Blue-Green deployments via CodeDeploy.
It integrates Terraform for infrastructure as code, Jenkins for CI/CD automation, and Docker for containerization, ensuring zero-downtime deployments and multi-environment support.

# 📂 Project Structure
ecs/
│  ├─ main.tf              # ECS Cluster, Service, Task Definition
│  ├─ variables.tf
│  └─ outputs.tf
codedeploy/
│  ├─ main.tf              # CodeDeploy App + Deployment Group
│  ├─ variables.tf
│  └─ outputs.tf
jenkins/
│  ├─ Jenkinsfile          # CI/CD pipeline
│  └─ codedeploy/
│     ├─ appspec.yaml      # Deployment hooks
│     └─ taskdef.json.tpl  # ECS Task Definition template
app/
│  ├─ app.py               # Flask app
│  └─ Dockerfile
README.md

# ⚙️ Features

CI/CD Pipeline (Jenkins):

Build & test Flask app

Build & push Docker image to AWS ECR

Trigger Terraform to provision/update infrastructure

Deploy new version via ECS Blue-Green strategy

Infrastructure as Code (Terraform):

VPC, Subnets, ALB

ECS Cluster + Services (Fargate)

CodeDeploy with Blue-Green traffic shifting

Blue-Green Deployment:

Deploy a new version ("green") alongside the old one ("blue")

Gradually shift traffic using ALB + CodeDeploy

Rollback automatically on failure

Dockerized Application:

Flask-based microservice

Runs in ECS Fargate

# 🚀 Deployment Flow

Developer commits code → GitHub

Jenkins Pipeline runs:

Build → Docker → ECR → Terraform → ECS → CodeDeploy

CodeDeploy performs Blue-Green Deployment

ALB shifts traffic between old and new tasks

✅ Zero Downtime Deployment

# 🛠️ Tech Stack

AWS: ECS Fargate, ECR, ALB, VPC, CodeDeploy

Terraform: Infrastructure as Code

Jenkins: CI/CD Automation

Docker: Containerization

Flask: Sample Python Web App

# 📖 Getting Started
Prerequisites

AWS CLI configured

Terraform installed

Docker installed

Jenkins server set up with AWS credentials

Steps

Clone this repo

Configure Terraform backend & variables

Run pipeline in Jenkins

Access the app via ALB DNS

# 📊 Architecture
[ Developer ] → [ GitHub ] → [ Jenkins Pipeline ]
                  ↓
     [ Docker Build ] → [ AWS ECR ]
                  ↓
         [ Terraform Apply ]
                  ↓
     [ ECS Fargate + ALB + CodeDeploy ]
                  ↓
       [ Blue/Green Deployment ]
                  ↓
      [ Zero-Downtime App Access ]

# 📌 Future Enhancements

Add Prometheus + Grafana monitoring

Multi-region deployments

Automated scaling policies
