resource "aws_ecs_cluster" "main" {
  name = "${var.project}-cluster"
  tags = {
    Name      = "rg-lab-tracker-cluster"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
resource "aws_ecs_task_definition" "main" {
  family                   = "${var.project}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  cpu    = "512"
  memory = "1024"

  execution_role_arn = var.execution_role_arn

  container_definitions = jsonencode([
    {
      name      = var.project
      image     = var.app_image
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          protocol      = "tcp"
        }
      ]

      environment = [
        {
          name  = "REDIS_HOST"
          value = "127.0.0.1"
        },
        {
          name  = "REDIS_PORT"
          value = "6379"
        }
      ]
    },
    {
      name      = "${var.project}-redis"
      image     = "redis:7-alpine"
      essential = true

      portMappings = [
        {
          containerPort = 6379
          protocol      = "tcp"
        }
      ]
    }
  ])

  tags = {
    Name      = "${var.project}-task"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
resource "aws_ecs_service" "main" {
  name            = "${var.project}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [var.ecs_security_group_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.project
    container_port   = 5000
  }

  tags = {
    Name      = "${var.project}-service"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}