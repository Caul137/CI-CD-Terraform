variable "cpu" {
  type = string
}

variable "memory" {
  type = string
}

variable "service_name" {
  type = string
}

variable "branch_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "api_key" {
  type      = string
  sensitive = true
}

variable "DB_HOST" {
  type = string
}

variable "DB_NAME" {
  type = string
}


variable "DB_PASSWORD" {
  type      = string
  sensitive = true
}


variable "API_GATEWAY_URL" {
  type = string
}
