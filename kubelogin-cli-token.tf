locals {
  kubeconfig    = {
    apiVersion  = "v1"
    preferences = {}
    kind        = "Config"
    users = [{
      name = "demouser"
      user = {
        exec = {
          apiVersion = "client.authentication.k8s.io/v1beta1"
          command    = "kubelogin"
          args = [
            "get-token",
            "--server-id",
            "<AAD server app ID>",
            "--login",
            "azurecli"
          ]
        }
      }
    }]
  }
}

output "kubeconfig_azure_cli_token_login" {
  value = yamlencode(local.kubeconfig)
}
