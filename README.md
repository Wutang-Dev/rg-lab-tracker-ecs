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

**Build documentation showing how I built the project:** [BUILD.md](build.md) — documenting each stage from local development and Docker to deployment through the AWS Console.
