output "tokenValue" {
  description = "value of the token"
  value = kubernetes_token_request_v1.token_request.token
}
