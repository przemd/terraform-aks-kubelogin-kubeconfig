locals {
  kubeconfig = {
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
            "--login",
            "msi"
          ]
        }
      }
    }]
  }
}

output "kubeconfig_msi" {
  value = yamlencode(local.kubeconfig)
}
