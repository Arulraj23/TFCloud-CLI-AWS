terraform {
  cloud {
    organization = "kmccorp-tfc"

    workspaces {
      name = "TFCloud-CLI-AWS"
    }
  }
}