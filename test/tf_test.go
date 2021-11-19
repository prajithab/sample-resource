package test

import (
	"testing"
	"os"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
//	"database/sql"
//	_ "github.com/go-sql-driver/mysql"
//	"github.com/gruntwork-io/terratest/modules/environment"
//	"time"
)





func	TestCloudSQLMySQL(t *testing.T) {

	
//	os.Environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/Users/N488567/bin/digital-dfp-dev.json"
	os.Environ()
	 terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
                TerraformDir: "../examples/",
                VarFiles: []string{"terratest.tfvars"},
                NoColor: true,
        })
	defer terraform.Destroy(t, terraformOptions)

	
        // website::tag::2::Run "terraform init" and "terraform apply".
        // This will run `terraform init` and `terraform apply` and fail the test if there are any errors
        terraform.InitAndApply(t, terraformOptions)

	
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
