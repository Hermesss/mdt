variable "subscription_id"{}
variable "client_id"{}
variable "client_secret"{}
variable "tenant_id"{}
variable "azure_region" {
    default = "West Europe"
}
variable "rgname" {
    default = "K8s_RG"
}
variable "environment" {
   default =   "LAB"
}
variable "owner" {
   default =   "Denys.Lapenkov"
}