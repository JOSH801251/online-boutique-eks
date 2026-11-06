
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.26.0"

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id     = aws_vpc.main.id
  subnet_ids = aws_subnet.private[*].id

  endpoint_public_access       = true
  endpoint_private_access      = true
  endpoint_public_access_cidrs = ["205.254.163.237/32"]

  enable_cluster_creator_admin_permissions = true
  enable_irsa                              = true

  eks_managed_node_groups = {
    general = {
      name           = "${var.cluster_name}-general"
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"

      min_size     = 2
      max_size     = 3
      desired_size = 2

      subnet_ids = aws_subnet.private[*].id

      # Use a short, fixed IAM role name
      iam_role_name            = "${var.cluster_name}-nodes"
      iam_role_use_name_prefix = false
    }
  }

  addons = {
    coredns                = {}
    kube-proxy             = {}
    vpc-cni                = {}
    eks-pod-identity-agent = {}
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
    Terraform   = "true"
  }
}
