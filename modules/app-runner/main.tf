



resource "aws_apprunner_service" "this" {
  service_name = var.service_name

  source_configuration {
    # authentication_configuration {
    #   connection_arn = aws_apprunner_connection.example.arn
    # }
    code_repository {
      code_configuration {
        code_configuration_values {
          build_command = "npm install"
          port          = "8000"
          runtime       = "NODEJS_22"
          start_command = "npm start"

          runtime_environment_variables = {
            "NODE_ENV" = var.environment
            "API_KEY" = var.api_key

            "DB_HOST" = var.DB_HOST
            "DB_NAME" = var.DB_NAME
            "API_URL" = var.API_GATEWAY_URL
          }

        }
        configuration_source = "REPOSITORY"
      }
      repository_url = "https://github.com/Caul137/CI-CD-Terraform"
      source_code_version {
        type  = "BRANCH"
        value = var.branch_name
      }
    }
  }

  instance_configuration {
    cpu = var.cpu
    memory = var.memory
  }


  tags = {
    Name = "${var.service_name}-service-runner"
    Environment = var.environment
  }
}