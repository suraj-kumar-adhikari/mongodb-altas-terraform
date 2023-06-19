# Introduction

This project contains a Terraform module for creating MongoDB Atlas database. You can use this terraform module to deploy the database, use AWS VPC peering as well as export required metrics to Datadog for example.

## Prerequisites

In oder to use the terraform module, you need to have items listed below.

* [MongoDB Cloud account](https://www.mongodb.com/cloud)
* [MongoDB Atlas Organization](https://cloud.mongodb.com/v2#/preferences/organizations/create)
* [MongoDB Atlas API key](https://www.terraform.io/docs/providers/mongodbatlas/index.html)
* [ Optional - AWS account (for VPC peering setup)](https://aws.amazon.com/console/)

## Terraform Requirements

| Name              | Version   |
|-------------------|-----------|
| terraform version | \>= 1.5.0 |

## Providers

| Name                           | Version  |
|--------------------------------|----------|
| aws provider version           | \~> 5.3  |
| mongodb atlas provider version | \~> 1.10 |

## Roadmap

Note: Roadmap will be updated as we progress through the tasks

- [x] Introduce readme 
  - [x] Create an initial readme file explaining the details fo the module.
- [x] Add Pre commit hooks mentioned in the task PDF 
- [x] Add Github actions workflow files 
  - [x] Add a Github action workflow file which gets triggered whenever a new pull request gets created. It will run terraform validate, terraform plan and post the details of the run to the pull request as a comment.
  - [x] Add a Github action workflow file to terraform plan and apply once the changes are merged to master.
- [x] Add terraform resources from mongodbatlas provider to create mongodbatlas database
- [x] Add terraform resources for AWS VPC peering with the help of aws provider
- [x] Add terraform resources for third party integration such as datadog for alerting
- [x] Add terraform resources for maintenance window
- [ ] Add terratest for integration test

## Usages / Examples

You can find all the examples of this module below, just click on the examples.

<details>
  <summary>Provision cluster</summary>

### Atlas Cluster Examples
  ```terraform
module "mongodb_atlas_cluster" {
    source = "./mongodbatlas"
  
    atlas_cluster_name = "my-cluster"
  
    atlas_cluster_provider_name    = "TENANT"
    atlas_cluster_backing_provider = "AWS"
    atlas_cluster_region           = "EU_CENTRAL_1"
    atlas_cluster_version          = "6.0"
    atlas_cluster_size_name        = "M0"
  
    # Authentication credentials for authenticating to MongoDB via API
    atlas_api_private_key = "<sensitive-value-get-it-via-tfvars-or-vault>"
    atlas_api_public_key  = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    atlas_org_id       = "<org-id>"
    atlas_project_name = "my-project"
  
    # MongoDB admin user (has full admin access)
    mongo_database_admin_user     = "<sensitive-value-get-it-via-tfvars-or-vault>"
    mongo_database_admin_password = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    # MongoDB application user (has read and write access)
    mongo_database_app_user     = "<sensitive-value-get-it-via-tfvars-or-vault>"
    mongo_database_app_password = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    # MongoDB database name
    mongo_database_name = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    # Cluster cidr range
    atlas_cluster_cidr = "192.168.248.0/24"
  
    # For ip access list
    ip_access_list = {
      "Personal IP" : "192.168.0.1"
    }
  
    # For cidr access list
      cidr_access_list = {
        "CIDR" : "192.168.0.0/24"
      }
}
  ```
</details>

<details>
  <summary>Provision cluster with VPC peering</summary>

### Atlas Cluster Examples
  ```terraform
module "mongodb_atlas_cluster" {
    source = "./mongodbatlas"
  
    atlas_cluster_name = "my-cluster"
  
    atlas_cluster_provider_name    = "TENANT"
    atlas_cluster_backing_provider = "AWS"
    atlas_cluster_region           = "EU_CENTRAL_1"
    atlas_cluster_version          = "6.0"
    atlas_cluster_size_name        = "M0"
  
    # Authentication credentials for authenticating to MongoDB via API
    atlas_api_private_key = "<sensitive-value-get-it-via-tfvars-or-vault>"
    atlas_api_public_key  = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    atlas_org_id       = "<org-id>"
    atlas_project_name = "my-project"
  
    # MongoDB admin user (has full admin access)
    mongo_database_admin_user     = "<sensitive-value-get-it-via-tfvars-or-vault>"
    mongo_database_admin_password = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    # MongoDB application user (has read and write access)
    mongo_database_app_user     = "<sensitive-value-get-it-via-tfvars-or-vault>"
    mongo_database_app_password = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    # MongoDB database name
    mongo_database_name = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    # Cluster cidr range
    atlas_cluster_cidr = "192.168.248.0/24"
  
    # For ip access list
    ip_access_list = {
      "Personal IP" : "192.168.0.1"
    }
  
    # For cidr access list
      cidr_access_list = {
        "CIDR" : "192.168.0.0/24"
      }
  
     # VPC peering example
      vpc_peer = {
        vpc_peer1 : {
          aws_account_id : "<account-id>"
          region : "eu-west-1"
          vpc_id : "<vpc-id>"
          route_table_cidr_block : "<cidr-block>"
        },
        vpc_peer2 : {
          aws_account_id : "<account-id>"
          region : "eu-central-1"
          vpc_id : "<vpc-id>"
          route_table_cidr_block : "<cidr-block>"
        }
      }
  
      # VPC security group allow multiple security group access
      vpc_peer_sg = {
        "sg 1": "<sg-id>"
        "sg 2": "<sg-id>"
      }
}
  ```
</details>

<details>
  <summary>Provision cluster with Datadog and Maintenance window</summary>

### Atlas Cluster Examples
  ```terraform
module "mongodb_atlas_cluster" {
    source = "./mongodbatlas"
  
    atlas_cluster_name = "my-cluster"
  
    atlas_cluster_provider_name    = "TENANT"
    atlas_cluster_backing_provider = "AWS"
    atlas_cluster_region           = "EU_CENTRAL_1"
    atlas_cluster_version          = "6.0"
    atlas_cluster_size_name        = "M0"
  
    # Authentication credentials for authenticating to MongoDB via API
    atlas_api_private_key = "<sensitive-value-get-it-via-tfvars-or-vault>"
    atlas_api_public_key  = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    atlas_org_id       = "<org-id>"
    atlas_project_name = "my-project"
  
    # MongoDB admin user (has full admin access)
    mongo_database_admin_user     = "<sensitive-value-get-it-via-tfvars-or-vault>"
    mongo_database_admin_password = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    # MongoDB application user (has read and write access)
    mongo_database_app_user     = "<sensitive-value-get-it-via-tfvars-or-vault>"
    mongo_database_app_password = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    # MongoDB database name
    mongo_database_name = "<sensitive-value-get-it-via-tfvars-or-vault>"
  
    # Cluster cidr range
    atlas_cluster_cidr = "192.168.248.0/24"
  
    # For ip access list
    ip_access_list = {
      "Personal IP" : "192.168.0.1"
    }
  
    # For cidr access list
      cidr_access_list = {
        "CIDR" : "192.168.0.0/24"
      }
  
    # Third party integration with datadog
    enable_datadog = true
    datadog_api_key = "<api-key-datadog>"
    datadog_region = "<datadog-region>"

    # Maintenance window
    enable_maintenance_window = true
    maintenance_window_day_of_week = 3
    maintenance_window_hour_of_day = 20
    maintenance_window_defer = false
}
  ```
</details>

## Inputs

| Name                           | Description                                                                  | Type     | Default          | Required |
|--------------------------------|------------------------------------------------------------------------------|----------|------------------|:--------:|
| cloud_region                   | Region in which Cloud Resources to be created                                | string   |                  |   Yes    |
| atlas_org_id                   | MongoDB Atlas Organisation ID                                                | string   |                  |   Yes    |
| atlas_project_name             | MongoDB Atlas Project Name                                                   | string   |                  |   Yes    |
| atlas_api_public_key           | MongoDB Atlas API public key                                                 | string   |                  |   Yes    |
| atlas_api_private_key          | MongoDB Atlas API private key                                                | string   |                  |   Yes    |
| atlas_cluster_provider_name    | Cluster provider for MongoDB atlas                                           | string   | TENANT           |    No    |
| atlas_cluster_backing_provider | Cloud provider for MongoDB atlas                                             | string   | AWS              |    No    |
| atlas_cluster_region           | Mongo Atlas region name                                                      | string   | EU_CENTRAL_1     |    No    |
| atlas_cluster_version          | Version of the MongoDB cluster to deploy                                     | string   | 6.0              |    No    |
| atlas_cluster_size_name        | Type of the MongoDB cluster to deploy                                        | string   | M0               |    No    |
| atlas_cluster_cidr             | Atlas CIDR block, must be at least a /24 and at most a /21                   | string   | 192.168.248.0/24 |    No    |
| mongo_database_name            | MongoDB Database name                                                        | string   |                  |   Yes    |
| mongo_database_admin_user      | MongoDB Database admin username                                              | string   |                  |   Yes    |
| mongo_database_admin_password  | MongoDB Database admin password                                              | string   |                  |   Yes    |
| mongo_database_app_user        | MongoDB Database application username                                        | string   |                  |   Yes    |
| mongo_database_app_password    | MongoDB Database application user password                                   | string   |                  |   Yes    |
| ip_access_list                 | Network ip access-lists for the project                                      | map(any) | {}               |   Yes    |
| cidr_access_list               | Network cidr access-lists for the project                                    | map(any) | {}               |   Yes    |
| atlas_cluster_cidr             | Atlas CIDR block, must be at least a /24 and at most a /21                   | map(any) | {}               |   Yes    |
| vpc_peer                       | An object that contains all VPC peering requests from the cluster to AWS VPC | map(any) | {}               |   Yes    |
| vpc_peer_sg                    | VPC peer security group map                                                  | map(any) | {}               |   Yes    |
| enable_datadog                 | Enable Datadog or not                                                        | bool     | false            |   Yes    |
| datadog_api_key                | Datadog api key                                                              | string   | ""               |   Yes    |
| datadog_region                 | Datadog region                                                               | string   | ""               |   Yes    |
| enable_maintenance_window      | Enable Datadog or not                                                        | bool     | false            |   Yes    |
| maintenance_window_day_of_week | Maintenance window day of the week                                           | number   | 1                |   Yes    |
| maintenance_window_hour_of_day | Maintenance window hour of the day                                           | number   | 18               |   Yes    |
| maintenance_window_defer       | Enable Maintenance window or not                                             | bool     | false            |   Yes    |


## Outputs

| Name                    | Description              |
|-------------------------|--------------------------|
| cluster_service_address | Cluster service address  |
| mongo_database_version  | MongoDB Database version |
