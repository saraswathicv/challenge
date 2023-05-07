output "private_key" {
  value     = length(tls_private_key.privkey) > 0 ? tls_private_key.privkey[0].private_key_pem : ""
  sensitive = true
}