package common

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/nexient-llc/lcaf-component-terratest-common/types"
	"github.com/stretchr/testify/assert"
)

func TestVnet(t *testing.T, ctx types.TestContext) {
	t.Run("TestAlwaysSucceeds", func(t *testing.T) {
		assert.Equal(t, "foo", "foo", "Should always be the same!")
		assert.NotEqual(t, "foo", "bar", "Should never be the same!")
	})

	t.Run("TestVnet", func(t *testing.T) {
		vnetId := terraform.Output(t, ctx.TerratestTerraformOptions, "vnet_id")
		rgId := terraform.Output(t, ctx.TerratestTerraformOptions, "resource_group_id")

		assert.NotEmpty(t, vnetId, "VNet ID must not be empty")
		assert.NotEmpty(t, rgId, "Resource Group ID must not be empty")
	})
}
