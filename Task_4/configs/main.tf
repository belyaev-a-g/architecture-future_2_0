terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = var.aws_region
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # Перенаправляем вызовы API Gateway на MiniStack
  endpoints {
    apigateway = var.localstack_endpoint
  }
}

# 1. Создаем сам REST API
resource "aws_api_gateway_rest_api" "local_api" {
  name        = var.api_name
  description = "Локальный API Gateway для тестов"
  
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

# 2. Создаем ресурс (путь) /users в нашем API
resource "aws_api_gateway_resource" "users_resource" {
  rest_api_id = aws_api_gateway_rest_api.local_api.id
  parent_id   = aws_api_gateway_rest_api.local_api.root_resource_id
  path_part   = "users"
}

# 3. Создаем метод GET для пути /users
resource "aws_api_gateway_method" "get_users" {
  rest_api_id   = aws_api_gateway_rest_api.local_api.id
  resource_id   = aws_api_gateway_resource.users_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

# 4. Имитируем ответ (Mock-интеграция), чтобы API возвращал статус 200 без бэкенда
resource "aws_api_gateway_integration" "future_gateway" {
  rest_api_id = aws_api_gateway_rest_api.local_api.id
  resource_id = aws_api_gateway_resource.users_resource.id
  http_method = aws_api_gateway_method.get_users.http_method
  type        = "MOCK"

  request_templates = {
    "application/json" = "{\"statusCode\": 200}"
  }
}

