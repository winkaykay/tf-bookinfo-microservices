terraform {
  backend "remote" {
    organization = "bookinfo"

    workspaces {
      name = "bookinfo-ratings"
    }
  }
}
