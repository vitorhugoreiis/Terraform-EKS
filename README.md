<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.40.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.12.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.27.0 |

## Providers

| Name | Version | Terraform |
|------|---------|---------|
| <a name="aws"></a> [aws](#requirement\_aws) | 5.40.0 |https://registry.terraform.io/providers/hashicorp/aws/latest |
| <a name="helm"></a> [helm](#requirement\_helm) | 2.12.1 |https://registry.terraform.io/providers/hashicorp/helm/latest |
| <a name="kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.27.0 |https://registry.terraform.io/providers/hashicorp/kubernetes/latest |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./modules/cluster | n/a |
| <a name="module_eks_load_balancer_controller"></a> [eks\_load\_balancer\_controller](#module\_eks\_load\_balancer\_controller) | ./modules/aws-load-balancer-controller | n/a |
| <a name="module_eks_managed_node_group"></a> [eks\_managed\_node\_group](#module\_eks\_managed\_node\_group) | ./modules/managed-node-group | n/a |
| <a name="module_eks_network"></a> [eks\_network](#module\_eks\_network) | ./modules/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Networking CIDR block to be used for the VPC | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name to be used to name the resources (Name tag) | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->