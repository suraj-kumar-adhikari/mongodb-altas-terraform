output "cluster_service_address" {
  value       = module.mongodb_atlas_cluster.cluster_service_address
  description = "Cluster service address"
}

output "mongo_database_version" {
  value       = module.mongodb_atlas_cluster.mongo_database_version
  description = "MongoDB Database version"
}
