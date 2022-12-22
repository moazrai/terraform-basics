terraform {
  cloud {
    organization = "moazshorbagy"

    workspaces {
      name = "tutorial-workspace"
    }
  }
}
