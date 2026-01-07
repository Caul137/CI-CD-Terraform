# resource "aws_apprunner_vpc_connector" "connector" {
#   vpc_connector_name = "${var.service_name}-vpc-connector"
#   subnets            = var.subnet_ids 
#   security_groups    = [var.security_group_id]
# }


resource "aws_apprunner_service" "this" {
  service_name = var.service_name

  source_configuration {
    authentication_configuration {
      connection_arn = aws_apprunner_connection.example.arn
    }
    code_repository {
      code_configuration {
        code_configuration_values {
          build_command = "python setup.py develop"
          port          = "8000"
          runtime       = "PYTHON_3"
          start_command = "python runapp.py"
        }
        configuration_source = "API"
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

  network_configuration {
    egress_configuration {
      egress_type       = "VPC"
      vpc_connector_arn = aws_apprunner_vpc_connector.connector.arn
    }
  }

  tags = {
    Name = "${var.service_name}-service-runner"
  }
}