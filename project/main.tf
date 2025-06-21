module "repository" {
  source = "./subsystems/version-control-platform"
}

output "project" {
  description = "Project deployment information"
  value = {
    version_control_platform = {
      repository = module.repository.project_repository
    }
  }
}
