locals {
    ingress_rules = [
      {
        port        = 53
        description = "Ingress rule for port 53"
      },
      {
        port        = 25
        description = "Ingress rule for port 25"
      }
    ]
}
  