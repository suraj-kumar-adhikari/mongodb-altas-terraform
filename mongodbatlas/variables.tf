variable "atlas_org_id" {
  description = "MongoDB Atlas org id"
  type        = string
}

variable "atlas_project_name" {
  description = "MongoDB Atlas project name"
  type        = string
}

variable "atlas_api_public_key" {
  description = "MongoDB Atlas public API key"
  type        = string
}

variable "atlas_api_private_key" {
  description = "Mongo Atlas private API key"
  type        = string
}

#variable "cloud_region" {
#  description = "Region in which Cloud Resources to be created"
#  type        = string
#  default     = "eu-west-2"
#}

variable "atlas_cluster_provider_name" {
  description = "Cluster provider for MongoDB atlas"
  type        = string
  default     = "TENANT"
}

variable "atlas_cluster_backing_provider" {
  description = "Cloud provider for MongoDB atlas"
  type        = string
  default     = "AWS"
}

#To check the cloud regions for AWS https://www.mongodb.com/docs/atlas/reference/amazon-aws/
variable "atlas_cluster_region" {
  description = "Mongo Atlas region name"
  type        = string
  default     = "EU_CENTRAL_1"
}

variable "atlas_cluster_version" {
  description = "Version of the MongoDB cluster to deploy"
  type        = string
  default     = "6.0"
}

variable "atlas_cluster_size_name" {
  description = "Type of the MongoDB cluster to deploy"
  type        = string
  default     = "M0"
}

#variable "atlas_cluster_cidr" {
#  description = "Atlas CIDR block, must be at least a /24 and at most a /21"
#  type        = string
#  default     = "192.168.248.0/24"
#}

#variable "atlas_cluster_allow_inbound_from_cidr" {
#  description = "CIDR block to allow inbound traffic to the cluster"
#  type        = string
#  default     = "95.91.214.30/32"
#}

variable "mongo_database_name" {
  description = "MongoDB Database name"
  type        = string
}

variable "mongo_database_admin_user" {
  description = "MongoDB Database admin username"
  type        = string
}

variable "mongo_database_admin_password" {
  description = "MongoDB Database admin password"
  type        = string
}

variable "mongo_database_app_user" {
  description = "MongoDB Database application username"
  type        = string
}

variable "mongo_database_app_password" {
  description = "MongoDB Database application user password"
  type        = string
}