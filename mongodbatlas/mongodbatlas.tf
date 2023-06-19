// Resource to add MongoDB Atlas project
// More information can be found here https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project
resource "mongodbatlas_project" "atlas_project" {
  name   = var.atlas_project_name
  org_id = var.atlas_org_id
}

// Resource to add MongoDB Atlas cluster
// More information can be found here https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/cluster
resource "mongodbatlas_cluster" "cluster" {
  depends_on = [mongodbatlas_project.atlas_project]

  project_id = mongodbatlas_project.atlas_project.id
  name       = var.atlas_cluster_name

  mongo_db_major_version = var.atlas_cluster_version

  provider_name               = var.atlas_cluster_provider_name
  backing_provider_name       = var.atlas_cluster_backing_provider
  provider_region_name        = var.atlas_cluster_region
  provider_instance_size_name = var.atlas_cluster_size_name
}

// Resource to add ip access list for MongoDB cluster
// More information can be found here https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project_ip_access_list
resource "mongodbatlas_project_ip_access_list" "ip_access_list" {
  depends_on = [mongodbatlas_cluster.cluster]

  for_each = var.ip_access_list

  project_id = mongodbatlas_project.atlas_project.id
  comment    = each.key
  ip_address = each.value
}

// Resource to add ip access list for MongoDB cluster
// More information can be found here https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project_ip_access_list
resource "mongodbatlas_project_ip_access_list" "cidr_access_list" {
  depends_on = [mongodbatlas_cluster.cluster]

  for_each = var.cidr_access_list

  project_id = mongodbatlas_project.atlas_project.id
  comment    = each.key
  cidr_block = each.value
}

// Resource to add database user for MongoDB
// More information can be found here https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/database_user
resource "mongodbatlas_database_user" "admin" {
  depends_on = [mongodbatlas_cluster.cluster]

  project_id = mongodbatlas_project.atlas_project.id

  username           = var.mongo_database_admin_user
  password           = var.mongo_database_admin_password
  auth_database_name = "admin"

  roles {
    role_name     = "dbAdmin"
    database_name = "admin"
  }
}

// Resource to add database user for MongoDB
// More information can be found here https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/database_user
resource "mongodbatlas_database_user" "application" {
  depends_on = [mongodbatlas_cluster.cluster]

  project_id = mongodbatlas_project.atlas_project.id

  username           = var.mongo_database_app_user
  password           = var.mongo_database_app_password
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = var.mongo_database_name
  }
}

// Resource to add network container for MongoDB
// More information can be found here https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/network_container
resource "mongodbatlas_network_container" "network_container" {
  depends_on = [mongodbatlas_cluster.cluster]

  project_id = mongodbatlas_project.atlas_project.id

  atlas_cidr_block = var.atlas_cluster_cidr
  provider_name    = var.atlas_cluster_backing_provider
  region_name      = var.atlas_cluster_region
}

// Resource to add network peering for integrating with AWS VPC
// More information can be found here https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/network_peering
resource "mongodbatlas_network_peering" "aws_peer" {
  depends_on = [mongodbatlas_network_container.network_container]

  for_each = var.vpc_peer

  project_id    = mongodbatlas_project.atlas_project.id
  container_id  = mongodbatlas_network_container.network_container.id
  provider_name = var.atlas_cluster_backing_provider

  accepter_region_name   = each.value.region
  route_table_cidr_block = each.value.route_table_cidr_block
  vpc_id                 = each.value.vpc_id
  aws_account_id         = each.value.aws_account_id
}

// Resource to add ip access list for MongoDB cluster
// More information can be found here https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/project_ip_access_list
resource "mongodbatlas_project_ip_access_list" "test" {
  depends_on = [mongodbatlas_network_peering.aws_peer]

  for_each = var.vpc_peer_sg

  project_id         = mongodbatlas_project.atlas_project.id
  aws_security_group = each.value
  comment            = each.key
}

// Resource to add third party integration such as datadog
// More information can be found here https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/third_party_integration
resource "mongodbatlas_third_party_integration" "datadog" {
  depends_on = [mongodbatlas_cluster.cluster]

  project_id = mongodbatlas_project.atlas_project.id
  type       = "DATADOG"
  api_key    = var.datadog_api_key
  region     = var.datadog_region

  count = var.enable_datadog == true ? 1 : 0
}

// Resource to add maintenance window for maintenance related tasks
// More information can be found here https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/maintenance_window
resource "mongodbatlas_maintenance_window" "maintenance" {
  depends_on = [mongodbatlas_cluster.cluster]

  project_id  = mongodbatlas_project.atlas_project.id
  day_of_week = var.maintenance_window_day_of_week
  hour_of_day = var.maintenance_window_hour_of_day
  defer       = var.maintenance_window_defer

  count = var.enable_maintenance_window == true ? 1 : 0
}
