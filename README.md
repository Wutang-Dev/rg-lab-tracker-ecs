# RG Lab Tracker — ECS

## Objective

Build, containerise and deploy a custom lab tracking application using Docker, Terraform and AWS ECS Fargate, with HTTPS and a custom domain. Demonstrating a production-style deployment workflow.

## Project Overview

This project involves building RG Lab Tracker, a Python Flask application that tracks completed AWS, Docker and Terraform labs through a web dashboard.

I built the application locally using Flask and Redis to store lab counts, with a custom green and black interface using my RG Infrastructure Labs branding.

I then containerised the application using a multi-stage Dockerfile, running Gunicorn as the application server under a non-root user.

I  first built the AWS infrastructure manually using the AWS Console before recreating it with Terraform and automating deployments using GitHub Actions.

**Build documentation showing how I built the project:** [BUILD.md](build.md) — documenting each stage from local development and Docker to deployment through the AWS Console.
