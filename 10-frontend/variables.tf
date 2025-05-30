variable project_name {
  default = "expense"
}

variable environment {
  default = "dev"
}

variable common_tags {
    type = map
    default = {
      Project = "expense"
      Environment = "dev"
      Terraform = "true"
      Component = "frontend"
    }
}

variable zone_name {
  default = "daws2025.online"
}

variable app_version {
  
}