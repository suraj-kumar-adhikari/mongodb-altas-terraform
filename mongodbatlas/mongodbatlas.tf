resource "mongodbatlas_project" "atlas_project" {
  name   = var.atlas_project_name
  org_id = var.atlas_org_id
}

resource "mongodbatlas_cluster" "main" {
  project_id = mongodbatlas_project.atlas_project.id
  name       = var.atlas_project_name

  mongo_db_major_version = var.atlas_cluster_version

  provider_name               = var.atlas_cluster_provider_name
  backing_provider_name       = var.atlas_cluster_backing_provider
  provider_region_name        = var.atlas_cluster_region
  provider_instance_size_name = var.atlas_cluster_size_name
}

resource "mongodbatlas_database_user" "admin" {
  depends_on         = [mongodbatlas_cluster.main]
  username           = var.mongo_database_admin_user
  password           = var.mongo_database_admin_password
  project_id         = mongodbatlas_project.atlas_project.id
  auth_database_name = "admin"

  roles {
    role_name     = "dbAdmin"
    database_name = "admin"
  }
}

resource "mongodbatlas_database_user" "application" {
  depends_on         = [mongodbatlas_cluster.main]
  username           = var.mongo_database_app_user
  password           = var.mongo_database_app_password
  project_id         = mongodbatlas_project.atlas_project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = var.mongo_database_name
  }
}
