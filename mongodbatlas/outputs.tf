output "cluster_service_address" {
  value       = mongodbatlas_cluster.main.srv_address
  description = "Cluster service address"
}

output "mongo_database_version" {
  value       = mongodbatlas_cluster.main.mongo_db_version
  description = "MongoDB Database version"
}
