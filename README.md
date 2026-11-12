# RG Lab Tracker — ECS

## Objective

Build, containerise and deploy a custom lab tracking application using Docker, Terraform and AWS ECS Fargate, with HTTPS and a custom domain. Demonstrating a production-style deployment workflow.

## Project Overview

This project involves building RG Lab Tracker, a Python Flask application that tracks completed AWS, Docker and Terraform labs through a web dashboard.

I built the application locally using Flask and Redis to store lab counts, with a custom green and black interface using my RG Infrastructure Labs branding.

I then containerised the application using a multi-stage Dockerfile, running Gunicorn as the application server under a non-root user.

I  first built the AWS infrastructure manually using the AWS Console before recreating it with Terraform and automating deployments using GitHub Actions.

### Redis and Gunicorn

I used Redis and Gunicorn alongside my Flask application to support the deployment on AWS ECS Fargate.

**Redis** runs as a separate container within the same ECS task, providing an in-memory data store for the application's lab tracking data.

**Gunicorn** acts as the production WSGI server, running my Flask application on port 5000 with two worker processes. The Application Load Balancer forwards incoming requests to Gunicorn, which handles them and passes them to Flask.

Both services run together within my ECS task.

**Build documentation showing how I built the project Locally on my machine and the AWS Console:** [build.md](build.md) — documenting  local development and Docker to deployment through the AWS Console.

### VPC Networking

I used Terraform to provision a VPC (`10.0.0.0/16`) with three public and three private subnets across three Availability Zones in AWS Stockholm (`eu-north-1`).

Public subnets route traffic through an Internet Gateway, while private subnets use a NAT Gateway for outbound internet access.

I chose a single NAT Gateway to reduce costs and keep the infrastructure simple for this learning project. In production, I would consider deploying one per Availability Zone to improve resilience and reduce cross-zone dependencies.
