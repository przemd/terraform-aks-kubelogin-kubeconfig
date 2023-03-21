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
            "workloadidentity"
          ]
        }
      }
    }]
  }
}

output "kubeconfig_workload_identity" {
  value = yamlencode(local.kubeconfig)
}
