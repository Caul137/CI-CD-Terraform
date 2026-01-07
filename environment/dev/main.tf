module "app_runner_dev" {
  source       = "../../modules/app-runner"
  service_name = "dev-app"
  cpu          = "0.25 vCPU"
  memory       = "0.5 GB"
  branch_name  = "main"
  environment  = "dev"
}