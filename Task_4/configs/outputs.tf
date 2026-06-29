output "api_gateway_id" {
  value       = aws_api_gateway_rest_api.local_api.id
  description = "Идентификатор созданного API Gateway"
}

output "api_gateway_arn" {
  value       = aws_api_gateway_rest_api.local_api.arn
  description = "ARN созданного API Gateway"
}

output "test_url" {
  value       = "http://localhost:4566/restapis/${aws_api_gateway_rest_api.local_api.id}/_stage_name_/local/users"
  description = "Шаблон URL для проверки работоспособности с хост-машины"
}

output "iam_role_arn" {
  value       = aws_iam_role.apigw_role.arn
  description = "ARN созданной IAM роли для API Gateway"
}
