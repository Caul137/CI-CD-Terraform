module "app_runner_dev" {
  source          = "../../modules/app-runner"
  service_name    = "dev-app"
  cpu             = "0.25 vCPU"
  memory          = "0.5 GB"
  branch_name     = "main"
  environment     = "dev"
  api_key         = var.api_key
  API_GATEWAY_URL = "url"
  DB_HOST         = "host"
  DB_NAME         = "db name"
  DB_PASSWORD     = var.DB_PASSWORD
}

output "app_url" {
  value = module.app_runner_dev.service_url
}
