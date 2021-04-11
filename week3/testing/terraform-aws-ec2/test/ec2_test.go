//use go get -t -v to download everything for running the tests

package test

import (
	"fmt"
	"time"
	"testing"
	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"


)

func TestTerraformEc2Example(t *testing.T){
	// The values to pass into the terraform cli
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		//The path to where the example terraform code is located
		TerraformDir: "../examples/webserver",
        //Variables to pass to the terraform code using -var options
		Vars: map[string] interface{}{
			"region":"us-west-2",
			"servername":"jhterrauw2",
		},
	})
    // Run a terraform init and apply with the terraform options
	terraform.InitAndApply(t, terraformOptions)
	//Run a terraform destroy at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	publicIp:=terraform.Output(t, terraformOptions, "public_ip")
	url:=fmt.Sprintf("http://%s:8080", publicIp)

	http_helper.HttpGetWithRetry(t, url, nil, 200 , "Small terraform module!", 30, 5*time.Second)
}