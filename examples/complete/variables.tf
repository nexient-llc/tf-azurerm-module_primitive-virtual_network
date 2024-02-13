// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

variable "product_family" {
  description = <<EOF
    (Required) Name of the product family for which the resource is created.
    Example: org_name, department_name.
  EOF
  type        = string
  default     = "dso"
}

variable "product_service" {
  description = <<EOF
    (Required) Name of the product service for which the resource is created.
    For example, backend, frontend, middleware etc.
  EOF
  type        = string
  default     = "demo"
}

variable "environment" {
  description = "Environment in which the resource should be provisioned like dev, qa, prod etc."
  type        = string
  default     = "dev"
}

variable "environment_number" {
  description = "The environment count for the respective environment. Defaults to 000. Increments in value of 1"
  type        = string
  default     = "000"
}

variable "region" {
  description = "AWS Region in which the infra needs to be provisioned"
  type        = string
  default     = "eastus"
}

variable "resource_names_map" {
  description = "A map of key to resource_name that will be used by tf-module-resource_name to generate resource names"
  type = map(object(
    {
      name       = string
      max_length = optional(number, 60)
    }
  ))
  default = {
    rg = {
      name       = "rg"
      max_length = 60
    }
    vnet = {
      name       = "vnet"
      max_length = 60
    }
  }
}

variable "address_space" {
  type        = list(string)
  default     = ["10.6.0.0/16"]
  description = "The address space that is used by the virtual network."
}

variable "subnet_names" {
  type        = list(string)
  default     = ["subnet-1", "subnet-2"]
  description = "A list of public subnets inside the vNet."
}

variable "subnet_prefixes" {
  type        = list(string)
  default     = ["10.6.1.0/24", "10.6.2.0/24"]
  description = "The address prefix to use for the subnet."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The tags to associate with your network and subnets."
}
