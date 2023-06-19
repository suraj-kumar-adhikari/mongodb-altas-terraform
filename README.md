# Introduction

This project contains a Terraform module for creating MongoDB Atlas database. You can use this terraform module to deploy the database, use AWS VPC peering as well as export required metrics to Datadog for example.

## Prerequisites

In oder to use the terraform module, you need to have items listed below.

* [MongoDB Cloud account](https://www.mongodb.com/cloud)
* [MongoDB Atlas Organization](https://cloud.mongodb.com/v2#/preferences/organizations/create)
* [MongoDB Atlas API key](https://www.terraform.io/docs/providers/mongodbatlas/index.html)
* [ Optional - AWS account (for VPC peering setup)](https://aws.amazon.com/console/)

## Terraform Requirements

| Name | Version |
|------|---------|
| terraform version | \>= 1.5.0 |

## Providers

| Name | Version |
|------|---------|
| aws provider version | \~> 5.3 |
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
- [ ] Add terraform resources for AWS VPC peering with the help of aws provider
- [ ] Add terraform resources for third party integration such as datadog for alerting
- [ ] Add terratest integration test for third party integration such as datadog for alerting

## Inputs

| Name                                  | Description                                                | Type   | Default          | Required |
|---------------------------------------|------------------------------------------------------------|--------|------------------|:--------:|
| cloud_region                          | Region in which Cloud Resources to be created              | string |                  |   Yes    |
| atlas_org_id                          | MongoDB Atlas Organisation ID                              | string |                  |   Yes    |
| atlas_project_name                    | MongoDB Atlas Project Name                                 | string |                  |   Yes    |
| atlas_api_public_key                  | MongoDB Atlas API public key                               | string |                  |   Yes    |
| atlas_api_private_key                 | MongoDB Atlas API private key                              | string |                  |   Yes    |
| atlas_cluster_provider_name           | Cluster provider for MongoDB atlas                         | string | TENANT           |   Yes    |
| atlas_cluster_backing_provider        | Cloud provider for MongoDB atlas                           | string | AWS              |   Yes    |
| atlas_cluster_region                  | Mongo Atlas region name                                    | string | EU_CENTRAL_1     |   Yes    |
| atlas_cluster_version                 | Version of the MongoDB cluster to deploy                   | string | 6.0              |   Yes    |
| atlas_cluster_size_name               | Type of the MongoDB cluster to deploy                      | string | M0               |   Yes    |
| atlas_cluster_cidr                    | Atlas CIDR block, must be at least a /24 and at most a /21 | string | 192.168.248.0/24 |   Yes    |
| atlas_cluster_allow_inbound_from_cidr | CIDR block to allow inbound traffic to the cluster         | string | 192.168.248.0/24 |   Yes    |
| mongo_database_name                   | MongoDB Database name                                      | string |                  |   Yes    |
| mongo_database_admin_user             | MongoDB Database admin username                            | string |                  |   Yes    |
| mongo_database_admin_password         | MongoDB Database admin password                            | string |                  |   Yes    |
| mongo_database_app_user               | MongoDB Database application username                      | string |                  |   Yes    |
| mongo_database_app_password           | MongoDB Database application user password                 | string |                  |   Yes    |


## Outputs

| Name                    | Description              |
|-------------------------|--------------------------|
| cluster_service_address | Cluster service address  |
| mongo_database_version  | MongoDB Database version |
