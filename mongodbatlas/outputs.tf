output "cluster_service_address" {
  value       = mongodbatlas_cluster.cluster.srv_address
  description = "Cluster service address"
}

output "mongo_database_version" {
  value       = mongodbatlas_cluster.cluster.mongo_db_version
  description = "MongoDB Database version"
}

output "cluster_id" {
  value       = mongodbatlas_cluster.cluster.cluster_id
  description = "MongoDB Atlas cluster ID"
}

output "mongo_uri" {
  value       = mongodbatlas_cluster.cluster.mongo_uri
  description = "Base connection string for the cluster"
}

output "mongo_uri_updated" {
  value       = mongodbatlas_cluster.cluster.mongo_uri_updated
  description = "Lists when the connection string was last updated"
}

output "container_id" {
  value       = mongodbatlas_cluster.cluster.container_id
  description = "The Network Peering Container ID"
}

output "paused" {
  value       = mongodbatlas_cluster.cluster.paused
  description = "Flag that indicates whether the cluster is paused or not"
}

output "state_name" {
  value       = mongodbatlas_cluster.cluster.state_name
  description = "Current state of the cluster"
}
