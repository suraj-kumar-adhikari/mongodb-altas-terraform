package tests

import "os"

type TerraformVariables struct {
	AtlasOrgId                  string
	AtlasProjectName            string
	AtlasClusterName            string
	AtlasApiPublicKey           string
	AtlasApiPrivateKey          string
	AtlasClusterProviderName    string
	AtlasClusterBackingProvider string
	AtlasClusterRegion          string
	AtlasClusterVersion         string
	AtlasClusterSizeName        string
	MongoDatabaseName           string
	MongoDatabaseAdminUser      string
	MongoDatabaseAdminPassword  string
	MongoDatabaseAppUser        string
	MongoDatabaseAppPassword    string
	IpAccessList                map[string]string
	AtlasClusterCidr            string
}

func GetTerraformVariables() TerraformVariables {
	return TerraformVariables{
		AtlasOrgId:                  os.Getenv("atlas_org_id"),
		AtlasProjectName:            os.Getenv("atlas_project_name"),
		AtlasClusterName:            os.Getenv("atlas_cluster_name"),
		AtlasApiPublicKey:           os.Getenv("atlas_api_public_key"),
		AtlasApiPrivateKey:          os.Getenv("atlas_api_private_key"),
		AtlasClusterProviderName:    os.Getenv("atlas_cluster_provider_name"),
		AtlasClusterBackingProvider: os.Getenv("atlas_cluster_backing_provider"),
		AtlasClusterRegion:          os.Getenv("atlas_cluster_region"),
		AtlasClusterVersion:         os.Getenv("atlas_cluster_version"),
		AtlasClusterSizeName:        os.Getenv("atlas_cluster_size_name"),
		MongoDatabaseName:           os.Getenv("mongo_database_name"),
		MongoDatabaseAdminUser:      os.Getenv("mongo_database_admin_user"),
		MongoDatabaseAdminPassword:  os.Getenv("mongo_database_admin_password"),
	}
}
