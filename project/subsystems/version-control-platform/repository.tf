# The main project repository
resource "github_repository" "project_repository" {
  name         = "personal-platform"
  visibility   = "public"

  # Metadata
  homepage_url = "NA"
  description  = "A private administration system"
  topics = [
    "cybernetics",
    "distrubuted",
    "declarative",
  ]

  # Don't auto-initialize the repository
  auto_init       = true

  # Features
  has_issues      = false
  has_discussions = false
  has_projects    = false
  has_wiki        = false

  # Security and analysis
  security_and_analysis {
    secret_scanning {
      # Only valid for public repositories
      status = "enabled"
    }
    secret_scanning_push_protection {
      # Only valid for public repositories
      status = "disabled"
    }
  }
}

# Default Branches
resource "github_branch_default" "development" {
  repository = github_repository.project_repository.name
  branch     = "main"

  depends_on = [
    github_repository.project_repository
  ]
}

# Production Branch
locals {
  production_branch_name = "production"
}

resource "github_branch" "production" {
  repository = github_repository.project_repository.name
  branch     = local.production_branch_name

  depends_on = [
    github_repository.project_repository
  ]
}

resource "github_repository_ruleset" "production" {
  repository = github_repository.project_repository.name

  name = "${local.production_branch_name}-policies"
  target = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = [
        "refs/heads/${local.production_branch_name}"
      ]
      exclude = [
        "~DEFAULT_BRANCH"
      ]
    }
  }

  rules {
    deletion = false
    required_linear_history = true
    non_fast_forward = true
    pull_request {
      require_code_owner_review = true
    }
  }
}
