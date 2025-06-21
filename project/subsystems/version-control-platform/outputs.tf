# Outputs
output "project_repository" {
  description = "Information about the projects repository"
  value       = {
    full_name = github_repository.project_repository.full_name
    visibility = github_repository.project_repository.visibility
    ssh_clone_url = github_repository.project_repository.ssh_clone_url
    http_clone_url = github_repository.project_repository.http_clone_url
  }
}
