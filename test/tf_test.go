package test

import (
	// 	"fmt"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"os"
	"strings"
	"testing"
	// These modules may be useful once we get DB Connection techniques better understood.
	//	"database/sql"
	//	_ "github.com/go-sql-driver/mysql"
	//	"github.com/gruntwork-io/terratest/modules/environment"
	//	"time"
	"context"
	"golang.org/x/oauth2/google"
	sqladmin "google.golang.org/api/sqladmin/v1beta4"
)

func ListInstances(projectId string) ([]*sqladmin.DatabaseInstance, error) {
	ctx := context.Background()

	// Create an http.Client that uses Application Default Credentials.
	hc, err := google.DefaultClient(ctx, sqladmin.SqlserviceAdminScope)
	if err != nil {
		return nil, err
	}

	// Create the Google Cloud SQL service.
	service, err := sqladmin.New(hc)
	if err != nil {
		return nil, err
	}

	// List instances for the project ID.
	instances, err := service.Instances.List(projectId).Do()
	if err != nil {
		return nil, err
	}
	return instances.Items, nil
}

func TestSQLAndValidateconfigParams(t *testing.T) {
	os.Environ()
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/",
		VarFiles:     []string{"nprod.tfvars"},
		NoColor:      true,
	})

	defer terraform.Destroy(t, terraformOptions)

	//         This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// a simple test of existence. Other outputs should be tested as well
	// Best to test using gcloud api to confirm existence using a means other than terraform.

	instance_connection_name := terraform.Output(t, terraformOptions, "instance_connection_name")
	instance_name := terraform.Output(t, terraformOptions, "instance_name")
	instance_self_link := terraform.Output(t, terraformOptions, "instance_self_link")
	instance_service_account_email_address := terraform.Output(t, terraformOptions, "instance_service_account_email_address")
	private_address := terraform.Output(t, terraformOptions, "private_address")

	// Connect GCP and get SQL instance details
	instanceAggregatedList, err := ListInstances("digital-dfp-dev")
	if err != nil {
		t.Fatal(err)
	}
	for _, instanceList := range instanceAggregatedList {
		if strings.Compare(instanceList.Name, instance_name) == 0 {
			assert.Equal(t, instance_connection_name, instanceList.ConnectionName, "instance_connection_name should match")
			assert.Equal(t, instanceList.SelfLink, instance_self_link, "instance SelfLink should match")
			assert.Equal(t, instanceList.ServiceAccountEmailAddress, instance_service_account_email_address, "instance ServiceAccountEmailAddress should match")
			for _, iplist := range instanceList.IpAddresses {
				assert.Equal(t, iplist.IpAddress, private_address, "instance private_address should match")
			}
		}
	}
}
