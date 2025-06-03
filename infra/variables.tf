variable "location" {
  type        = string
  default     = "West US 2"
  description = "Región donde se desplegarán los recursos"
}

variable "sql_admin_user" {
  type        = string
  default     = "adminuser"
  description = "Usuario administrador del servidor SQL"
}

variable "sql_admin_password" {
  type        = string
  default     = "Upt.2025"
  sensitive   = true
  description = "Contraseña del administrador SQL"
}
