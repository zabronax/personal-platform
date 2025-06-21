variable "hetzner-project-token" {
  description = "The token for project development on Hetzner"
  type        = string
  sensitive   = true
}

variable "github-project-token" {
  description = "The token for project development on GitHub"
  type        = string
  sensitive   = true
}
