package test

import (
	_ "embed"
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

const (
	moduleDir = "../../modules"
)

var (
	//go:embed main.tf
	moduleContent string
)

func TestTerraformModule(t *testing.T) {
	// list all example modules
	var moduleNames []string
	entries, err := os.ReadDir(moduleDir)
	if !assert.NoError(t, err) {
		t.FailNow()
	}
	for _, entry := range entries {
		if entry.IsDir() {
			moduleNames = append(moduleNames, entry.Name())
		}
	}

	// get env vars
	envVars := map[string]string{"TF_LOG_PROVIDER": "WARN"}
	for _, envVar := range []string{
		"GUANCE_ACCESS_TOKEN",
	} {
		if os.Getenv(envVar) == "" {
			t.Fatalf("Environment variable %s must be set for acceptance tests", envVar)
		}
		envVars[envVar] = os.Getenv(envVar)
	}

	for _, name := range moduleNames {
		t.Run(name, func(t *testing.T) {
			moduleDir, err := filepath.Abs(filepath.Join(moduleDir, name))
			if !assert.NoError(t, err) {
				t.FailNow()
			}

			tempDir, err := os.MkdirTemp("", "tf-module-test-*")
			if !assert.NoError(t, err) {
				t.FailNow()
			}

			t.Logf("tempDir: %s", tempDir)

			sourceCode := strings.ReplaceAll(moduleContent, "{{ .name }}", name)
			sourceCode = strings.ReplaceAll(sourceCode, "{{ .path }}", moduleDir)
			if err := os.WriteFile(filepath.Join(tempDir, "main.tf"), []byte(sourceCode), 0600); !assert.NoError(t, err) {
				t.FailNow()
			}

			// retryable errors in terraform testing.
			terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
				TerraformDir: tempDir,
				Vars: map[string]interface{}{
					"name": fmt.Sprintf("tf-module-test-%s", name),
				},
				EnvVars: envVars,
				Upgrade: true,
			})

			// Clean up resources with "terraform destroy" at the end of the test.
			defer terraform.Destroy(t, terraformOptions)

			// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
			terraform.InitAndApply(t, terraformOptions)
		})
	}
}
