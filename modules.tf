module "eks_network" {
  source       = "./modules/network"
  cidr_block   = "10.0.0.0/16"
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = local.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b
  public_subnet_1c = module.eks_network.subnet_pub_1c
}

module "eks_managed_node_group" {
  source            = "./modules/managed-node-group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.cluster_name
  subnet_private_1a = module.eks_network.subnet_priv_1a
  subnet_private_1b = module.eks_network.subnet_priv_1b
  subnet_private_1c = module.eks_network.subnet_priv_1c
  tags              = local.tags
}

module "eks_load_balancer_controller" {
  source       = "./modules/aws-load-balancer-controller"
  project_name = var.project_name
  tags         = local.tags
  oidc         = module.eks_cluster.oidc
  cluster_name = module.eks_cluster.cluster_name
}