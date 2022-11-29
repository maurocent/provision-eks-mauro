module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.31.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access = true


  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
    attach_cluster_primary_security_group = true
    disk_size = 30

    # Disabling and using externally provided security groups
    create_security_group = true
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"
      instance_types = ["m5.large"]
      capacity_type = "ON_DEMAND"

      
      min_size     = 1
      max_size     = 2
      desired_size = 1

      pre_bootstrap_user_data = <<-EOT
      echo 'foo bar'
      EOT

      labels = {
        role = "one"
      }

      vpc_security_group_ids = [
        aws_security_group.node_group_one.id
      ]
    }
  }
}
