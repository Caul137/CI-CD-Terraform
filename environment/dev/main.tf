module "app_runner_dev" {
  source          = "../../modules/app-runner"
  service_name    = "dev-app"
  cpu             = "0.25 vCPU"
  memory          = "0.5 GB"
  branch_name     = "main"
  environment     = "dev"
  api_key         = var.api_key
  API_GATEWAY_URL = "sua url"
  DB_HOST         = "seu host"
  DB_NAME         = "nome do host"
}

output "app_url" {
  value = module.app_runner_dev.service_url
}