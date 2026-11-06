variable "aws_region" {
  description = "AWS region where the EKS cluster is deployed"
  type        = string
  default     = "ap-southeast-2"
}

variable "cluster_name" {
  description = "Name of the existing EKS cluster"
  type        = string
  default     = "online-boutique-eks"
}

variable "argocd_chart_version" {
  description = "Argo CD Helm chart version"
  type        = string
  default     = "10.14.0"
}

variable "repository_url" {
  description = "Git repository containing the Kubernetes manifests"
  type        = string
  default     = "https://github.com/JOSH801251/online-boutique-eks.git"
}