variable "name" {
  description = "identifider for this terraform stack"
}

variable "master_username_secret_manager_arn" {
  description = "master username aws secret manager arn"
}

variable "master_password_secret_manager_arn" {
  description = "master password aws secret manager arn"
}
