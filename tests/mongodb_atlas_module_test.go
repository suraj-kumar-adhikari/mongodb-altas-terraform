package tests

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestMongoDbClusterCreationIsSuccessFull(t *testing.T) {
	terraformVars := GetTerraformVariables()

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"atlas_org_id":                   terraformVars.AtlasOrgId,
			"atlas_project_name":             terraformVars.AtlasProjectName,
			"atlas_cluster_name":             terraformVars.AtlasClusterName,
			"atlas_api_public_key":           terraformVars.AtlasApiPublicKey,
			"atlas_api_private_key":          terraformVars.AtlasApiPrivateKey,
			"atlas_cluster_provider_name":    terraformVars.AtlasClusterProviderName,
			"atlas_cluster_backing_provider": terraformVars.AtlasClusterBackingProvider,
			"atlas_cluster_region":           terraformVars.AtlasClusterRegion,
			"atlas_cluster_version":          terraformVars.AtlasClusterVersion,
			"atlas_cluster_size_name":        terraformVars.AtlasClusterSizeName,
			"mongo_database_name":            terraformVars.MongoDatabaseName,
			"mongo_database_admin_user":      terraformVars.MongoDatabaseAdminUser,
			"mongo_database_admin_password":  terraformVars.MongoDatabaseAdminPassword,
			"mongo_database_app_user":        terraformVars.MongoDatabaseAppUser,
			"mongo_database_app_password":    terraformVars.MongoDatabaseAppPassword,
			"atlas_cluster_cidr":             terraformVars.AtlasClusterCidr,
		},
	}

	terraformOptions = terraform.WithDefaultRetryableErrors(t, terraformOptions)

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables and check they have the expected values.
	databaseVersion := terraform.Output(t, terraformOptions, "mongo_database_version")
	paused := terraform.Output(t, terraformOptions, "paused")

	checkMongoDbVersionBeginsWithSix := strings.HasPrefix(databaseVersion, "6")

	assert.True(t, checkMongoDbVersionBeginsWithSix)
	assert.Equal(t, "false", paused)
}
