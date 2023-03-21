locals {
  kubeconfig    = {
    apiVersion  = "v1"
    preferences = {}
    kind        = "Config"
    users = [{
      name = "user-name"
      user = {
        exec = {
          apiVersion = "client.authentication.k8s.io/v1beta1"
          command    = "kubelogin"
          args = [
            "get-token",
            "--server-id",
            "<AAD server app ID>",
            "--client-id",
            "<MSI app ID>",
            "--login",
            "msi"
          ]
        }
      }
    }]
  }
}

output "kubeconfig_msi_specific_client_id" {
  value = yamlencode(local.kubeconfig)
}
