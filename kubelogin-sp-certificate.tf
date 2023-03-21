locals {
  kubeconfig = {
    apiVersion = "v1"
    preferences = {}
    kind       = "Config"

    clusters = [
      {
        name = azurerm_kubernetes_cluster.aks.name
        cluster = {
          server                       = azurerm_kubernetes_cluster.aks.kube_config[0].host
          certificate_authority_data = azurerm_kubernetes_cluster.aks.kube_config[0].certificate_authority[0].data
        }
      }
    ]

    contexts = [
      {
        name = azurerm_kubernetes_cluster.aks.name
        context = {
          cluster = azurerm_kubernetes_cluster.aks.name
          user    = "demouser"
        }
      }
    ]

    current_context = azurerm_kubernetes_cluster.aks.name

    users = [
      {
        name = "demouser"
        user = {
          exec = {
            apiVersion = "client.authentication.k8s.io/v1beta1"
            command    = "kubelogin"
            args = [
              "get-token",
              "--environment",
              "AzurePublicCloud",
              "--server-id",
              "<AAD server app ID>",
              "--client-id",
              "<AAD client app ID>",
              "--client-certificate",
              "<client_certificate_path>",
              "--tenant-id",
              "<AAD tenant ID>",
              "--login",
              "spn"
            ]
            env = null
          }
        }
      }
    ]
  }
}

output "kubeconfig" {
  value = yamlencode(local.kubeconfig)
}
