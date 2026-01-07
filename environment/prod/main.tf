module "app_runner_dev" {
  source       = "../../modules/app-runner"
  service_name = "prod-app"
  cpu          = "1 vCPU"
  memory       = "2 GB"
  branch_name  = "main"
  environment  = "prod"
}