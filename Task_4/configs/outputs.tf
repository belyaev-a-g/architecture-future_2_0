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

output "datalake_bucket_name" {
  value       = aws_s3_bucket.datalake_bucket.bucket
  description = "Имя бакета Data Lake для сырых данных"
}

output "athena_database_name" {
  value       = aws_glue_catalog_database.analytics_db.name
  description = "Имя базы данных в Athena"
}

output "athena_table_name" {
  value       = aws_glue_catalog_table.users_actions_table.name
  description = "Имя таблицы для SQL-запросов"
}

