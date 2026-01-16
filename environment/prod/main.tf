module "app_runner_prod" {
  source          = "../../modules/app-runner"
  service_name    = "prod-app"
  cpu             = "1 vCPU"
  memory          = "2 GB"
  branch_name     = "main"
  environment     = "prod"
  api_key         = var.api_key
  API_GATEWAY_URL = "sua url"
  DB_HOST         = "seu host"
  DB_NAME         = "nome do host"
  DB_PASSWORD     = var.DB_PASSWORD
}

output "app_url" {
  value = module.app_runner_prod.service_url
}
