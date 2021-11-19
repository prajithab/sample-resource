package test

import (
	"testing"
	"os"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
// These modules may be useful once we get DB Connection techniques better understood.
//	"database/sql"
//	_ "github.com/go-sql-driver/mysql"
//	"github.com/gruntwork-io/terratest/modules/environment"
//	"time"
)





func	TestCloudSQLMySQL(t *testing.T) {

	os.Environ()
	 terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
                TerraformDir: "../examples/",
                VarFiles: []string{"terratest.tfvars"},
                NoColor: true,
        })
	
	defer terraform.Destroy(t, terraformOptions)

	
        // This will run `terraform init` and `terraform apply` and fail the test if there are any errors
        terraform.InitAndApply(t, terraformOptions)

	// a simple test of existence. Other outputs should be tested as well	
	// Best to test using gcloud api to confirm existence using a means other than terraform.
	dbConnectionNameFromOutput := terraform.Output(t, terraformOptions, "instance_connection_name")
	assert.Contains(t,dbConnectionNameFromOutput, "terratest")
	assert.NotContains(t,dbConnectionNameFromOutput, "adsfasdfasdfkj;klj;adslkjf;lkajsdf")

// Needs further review to connect dynamically. below requires separate outputs file to expose temp creds.
//	dbUserFromOutput := terraform.Output(t, terraformOptions, "user_name")
//	dbUserPWFromOutput := terraform.Output(t, terraformOptions, "generated_user_password")
//	dbUserPW := dbUserFromOutput + ":" + dbUserPWFromOutput
//	db,err := sql.Open(dbConnectionNameFromOutput, dbUserPW)
//
//	if err != nil {
//		panic(err)
//	}
//	db.SetConnMaxLifetime(time.Minute * 2)

}
