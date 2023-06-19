variable "cloud_region" {
  description = "Region in which Cloud Resources to be created"
  type        = string
  default     = "eu-west-2"
}

variable "atlas_org_id" {
  description = "MongoDB Atlas org id"
  type        = string
}

variable "atlas_project_name" {
  description = "MongoDB Atlas project name"
  type        = string
}

variable "atlas_cluster_name" {
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

variable "ip_access_list" {
  description = "Network ip access-lists for the project"
  type        = map(any)
  default     = {}
}

variable "cidr_access_list" {
  description = "Network cidr access-lists for the project"
  type        = map(any)
  default     = {}
}

variable "atlas_cluster_cidr" {
  description = "Atlas CIDR block, must be at least a /24 and at most a /21"
  type        = string
}

variable "vpc_peer" {
  description = "An object that contains all VPC peering requests from the cluster to AWS VPC"
  type        = map(any)
  default     = {}
}

variable "vpc_peer_sg" {
  description = "VPC peer security group map"
  type        = map(any)
  default     = {}
}

variable "enable_datadog" {
  description = "Enable Datadog or not"
  type        = bool
  default     = false
}

variable "datadog_api_key" {
  description = "Datadog api key"
  type        = string
  default     = ""
}

variable "datadog_region" {
  description = "Datadog region"
  type        = string
  default     = ""
}

variable "enable_maintenance_window" {
  description = "Enable Datadog or not"
  type        = bool
  default     = false
}

# Documentation here https://github.com/mongodb/terraform-provider-mongodbatlas/blob/master/website/docs/r/maintenance_window.html.markdown
variable "maintenance_window_day_of_week" {
  description = "Maintenance window day of the week"
  type        = number
  default     = 1
}

# Documentation here https://github.com/mongodb/terraform-provider-mongodbatlas/blob/master/website/docs/r/maintenance_window.html.markdown
variable "maintenance_window_hour_of_day" {
  description = "Maintenance window hour of the day"
  type        = number
  default     = 18
}

variable "maintenance_window_defer" {
  description = "Enable Maintenance window or not"
  type        = bool
  default     = false
}
