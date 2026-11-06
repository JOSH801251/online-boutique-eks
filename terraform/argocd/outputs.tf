output "argocd_release_name" {
  description = "Argo CD Helm release name"
  value       = helm_release.argocd.name
}

output "argocd_release_status" {
  description = "Argo CD Helm release status"
  value       = helm_release.argocd.status
}

output "argocd_namespace" {
  description = "Namespace where Argo CD is installed"
  value       = helm_release.argocd.namespace
}

output "argocd_chart_version" {
  description = "Installed Argo CD Helm chart version"
  value       = helm_release.argocd.version
}