output "ingress_lb_hostname" {
  description = "Hostname of this ingress resource"
  value = kubernetes_ingress_v1.ingress.status.0.load_balancer.0.ingress.0.hostname
}
output "ingress_lb_ip" {
  description = "IP of this ingress resource"
  value = kubernetes_ingress_v1.ingress.status.0.load_balancer.0.ingress.0.ip
}
