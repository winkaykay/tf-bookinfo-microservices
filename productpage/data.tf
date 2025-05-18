data "terraform_remote_state" "namespace" {
  backend = "remote"
  config = {
    organization = "bookinfo"
    workspaces = {
      name = "bookinfo-namespace"
    }
  }
}