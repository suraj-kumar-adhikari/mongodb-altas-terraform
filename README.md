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
- [ ] Add terraform resources from mongodbatlas provider to create mongodbatlas database
- [ ] Add terraform resources for AWS VPC peering with the help of aws provider
- [ ] Add terraform resources for third party integration such as datadog for alerting

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|      |             |      |         |          |

## Outputs

| Name | Description |
|------|-------------|
|      |             |