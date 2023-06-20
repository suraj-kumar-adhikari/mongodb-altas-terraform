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
	AtlasClusterCidr            string
}

func GetTerraformVariables() TerraformVariables {
	return TerraformVariables{
		AtlasOrgId:                  os.Getenv("ATLAS_ORG_ID"),
		AtlasProjectName:            os.Getenv("ATLAS_PROJECT_NAME"),
		AtlasClusterName:            os.Getenv("ATLAS_CLUSTER_NAME"),
		AtlasApiPublicKey:           os.Getenv("ATLAS_API_PUBLIC_KEY"),
		AtlasApiPrivateKey:          os.Getenv("ATLAS_API_PRIVATE_KEY"),
		AtlasClusterProviderName:    os.Getenv("ATLAS_CLUSTER_PROVIDER_NAME"),
		AtlasClusterBackingProvider: os.Getenv("ATLAS_CLUSTER_BACKING_PROVIDER"),
		AtlasClusterRegion:          os.Getenv("ATLAS_CLUSTER_REGION"),
		AtlasClusterVersion:         os.Getenv("ATLAS_CLUSTER_VERSION"),
		AtlasClusterSizeName:        os.Getenv("ATLAS_CLUSTER_SIZE_NAME"),
		MongoDatabaseName:           os.Getenv("MONGO_DATABASE_NAME"),
		MongoDatabaseAdminUser:      os.Getenv("MONGO_DATABASE_ADMIN_USER"),
		MongoDatabaseAdminPassword:  os.Getenv("MONGO_DATABASE_ADMIN_PASSWORD"),
		MongoDatabaseAppUser:        os.Getenv("MONGO_DATABASE_APP_USER"),
		MongoDatabaseAppPassword:    os.Getenv("MONGO_DATABASE_APP_PASSWORD"),
		AtlasClusterCidr:            os.Getenv("ATLAS_CLUSTER_CIDR"),
	}
}
