terraform {
  cloud {
    organization = "chris-hashicorp"

    workspaces {
      name = "demo-tfcb-drift"
    }
  }

  required_providers {
    tfe = {
      source = "hashicorp/tfe"
    }
  }
}

resource "tfe_workspace" "this" {
  name         = var.workspace_name
  organization = var.organization
  tag_names    = var.workspace_tags
  description  = "Demonstrate Drift Detection"

  vcs_repo {
    identifier     = var.vcs_repo
    oauth_token_id = var.oauth_token_id
  }
}
