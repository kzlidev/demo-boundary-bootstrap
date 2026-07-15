resource "boundary_auth_method_oidc" "auth0" {
  name               = var.oidc_auth_name
  description        = "OIDC Auth Method"
  scope_id           = var.oidc_scope_id
  issuer             = var.oidc_issuer
  client_id          = var.oidc_client_id
  client_secret      = var.oidc_client_secret
  signing_algorithms = var.oidc_signing_algorithms
  api_url_prefix     = var.oidc_api_url_prefix
}

resource "boundary_account_oidc" "name" {
  name           = "oidc_admin"
  auth_method_id = boundary_auth_method_oidc.auth0.id
  issuer         = var.oidc_issuer
  subject        = "auth0|68a7e34f30d7868a58f2174d"

}
