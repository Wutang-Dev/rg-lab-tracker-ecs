# Local Build 

I built the App locally on my machine first 

## docker build 

![docker build 1](images/2-docker-build%20.png)

![docker build 2](images/3-docker-build-2.png)

## local health check 

![local health check](images/3-local-health-check.png)

## local api check 

![local api check](images/4-local-api-check.png)

## local browser check

![local browser check](images/5-local-browser-check.png)

## Push App to Docker Hub

![Push App to Docker Hub](images/9-push-to-docker-hub.png)

![Docker Hub Browser](images/10-docker-hub-browser.png)

## Create ECR Container in AWS 

![ECR Container AWS](images/11-ECR-Container.png)

## Push App to ECR Container

![Push APP to ECR Container](images/12-ECR-push.png)

verified in the AWS console 

![Verify in AWS Console](images/13-verify-AWS-ECR-Push.png)

# AWS Console Build 

## ECS Cluster Creation 

![ECS Cluster Creation](images/14-ecs-cluster.png)

## ECS Task Definitions 

I created an ECS Fargate task definition (`ecs-rg-lab-tracker-task:1`) containing two containers: Flask/Gunicorn to serve the application on port 5000 and Redis to store lab counts on port 6379. I configured the environment variables, task execution role, and shared CPU and memory resources.

![ECS Task Definitions](images/15-ecs-task-definitions.png)

## VPC 

![VPC](images/16-vpc.png)

![VPC 2](images/17-vpc-2.png)

## Security Groups 

rg-lab-tracker-alb-sg - Allow HTTP and HTTPS traffic to ALB

![rg-lab-tracker-alb-sg](images/18-rg-lab-tracker-alb-sg.png)

rg-lab-tracker-ecs-sg - Allow ALB traffic to Flask application

![rg-lab-tracker-ecs-sg](images/19-rg-lab-tracker-ecs-sg.png)

## Aplication Load Balancer

target group 

![target group](images/20-target-group.png)

Application load balancer 

![ALB](images/21-alb.png)

## ECS Fargate Service 

![ECS Fargate Service](images/22-ecs-fargate-service.png)

![Containers](images/23-containers.png)

## Connect the ECS service to the target group

![ECS Task 1](images/24-ECS-task-1.png)

![ECS Task 1](images/25-ECS-task-2.png)

## Verify the target is healthy

![Healthy Target](images/26-healthy-target.png)

![Healthy Target 2](images/27-healthy-taget-2.png)

## Request an SSL/TLS certificate

![ACM Certificate](images/28-acm-cert.png)

## Configure HTTPS on the Application Load Balancer

HTTPS Listener

![HTTPS Listener](images/29-https-listener.png)

## Configure the HTTP redirect

[HTTP Redirect](images/30-http-redirect.png)

## Configure Route 53

[A Record](images/31-A-record.png)

terminal varification 

[Terminal Verification](images/32-terminal-verify.png)

## HTTPS Browser verification

[HTTPS Browser verification](images/33-https-browser-verify.png)
