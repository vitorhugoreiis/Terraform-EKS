module "eks_network" {
  source       = "./modules/network"
  cidr_block   = "10.0.0.0/16"
  project_name = "Eks-Development"
  tags         = local.tags
}