output "aws_load_balancer_controller_release_name" {
  description = "Helm release name"
  value       = helm_release.aws_load_balancer_controller.name
}

output "aws_load_balancer_controller_release_status" {
  description = "Helm release status"
  value       = helm_release.aws_load_balancer_controller.status
}

output "aws_load_balancer_controller_namespace" {
  description = "Kubernetes namespace"
  value       = helm_release.aws_load_balancer_controller.namespace
}