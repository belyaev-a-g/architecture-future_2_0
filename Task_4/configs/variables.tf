variable "aws_region" {
  type        = string
  description = "Регион AWS"
}

variable "localstack_endpoint" {
  type        = string
  description = "URL эмулятора MiniStack"
}

variable "api_name" {
  type        = string
  description = "Название создаваемого API Gateway"
}

