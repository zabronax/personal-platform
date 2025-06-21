resource "github_repository_collaborators" "project_collaborator" {
  repository = github_repository.project_repository.name

  # Collaborators
  user {
    username = "LarsGJobloop"
    permission = "push"
  }
  user {
    username = "LarsGKodehode"
    permission = "push"
  }
}
