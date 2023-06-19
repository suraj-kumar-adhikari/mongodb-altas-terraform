module "mongodb_atlas_cluster" {
  source = "./mongodbatlas"

  atlas_cluster_provider_name    = var.atlas_cluster_provider_name
  atlas_cluster_backing_provider = var.atlas_cluster_backing_provider
  atlas_cluster_region           = var.atlas_cluster_region
  atlas_cluster_version          = var.atlas_cluster_version
  atlas_cluster_size_name        = var.atlas_cluster_size_name

  atlas_api_private_key = var.atlas_api_private_key
  atlas_api_public_key  = var.atlas_api_public_key

  atlas_org_id       = var.atlas_org_id
  atlas_project_name = var.atlas_project_name

  mongo_database_admin_user     = var.mongo_database_admin_user
  mongo_database_admin_password = var.mongo_database_admin_password

  mongo_database_app_user     = var.mongo_database_app_user
  mongo_database_app_password = var.mongo_database_app_password

  mongo_database_name = var.mongo_database_name
}
