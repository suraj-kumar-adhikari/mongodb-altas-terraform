module "mongodb_atlas_cluster" {
  source = "./mongodbatlas"

  atlas_cluster_name = var.atlas_cluster_name

  atlas_cluster_provider_name    = var.atlas_cluster_provider_name
  atlas_cluster_backing_provider = var.atlas_cluster_backing_provider
  atlas_cluster_region           = var.atlas_cluster_region
  atlas_cluster_version          = var.atlas_cluster_version
  atlas_cluster_size_name        = var.atlas_cluster_size_name

  # Authentication credentials for authenticating to MongoDB via API
  atlas_api_private_key = var.atlas_api_private_key
  atlas_api_public_key  = var.atlas_api_public_key

  atlas_org_id       = var.atlas_org_id
  atlas_project_name = var.atlas_project_name

  # MongoDB admin user (has full admin access)
  mongo_database_admin_user     = var.mongo_database_admin_user
  mongo_database_admin_password = var.mongo_database_admin_password

  # MongoDB application user (has read and write access)
  mongo_database_app_user     = var.mongo_database_app_user
  mongo_database_app_password = var.mongo_database_app_password

  # MongoDB database name
  mongo_database_name = var.mongo_database_name

  # Cluster cidr range
  atlas_cluster_cidr = var.atlas_cluster_cidr

  # For ip access list
  ip_access_list = {
    "Personal IP" : "95.91.214.30"
  }

  # For cidr access list
  #  cidr_access_list = {}

  #   # VPC peering example
  #    vpc_peer = {
  #      vpc_peer1 : {
  #        aws_account_id : "<account-id>"
  #        region : "eu-west-1"
  #        vpc_id : "<vpc-id>"
  #        route_table_cidr_block : "<cidr-block>"
  #      },
  #      vpc_peer2 : {
  #        aws_account_id : "<account-id>"
  #        region : "eu-central-1"
  #        vpc_id : "<vpc-id>"
  #        route_table_cidr_block : "<cidr-block>"
  #      }
  #    }

  #  # VPC security group allow multiple security group access
  #  vpc_peer_sg = {
  #    "sg 1": "<sg-id>"
  #    "sg 2": "<sg-id>"
  #  }


  #  # Third party integration with datadog
  #  datadog_api_key = ""
  #  datadog_region = ""
}
