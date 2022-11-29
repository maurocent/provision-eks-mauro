variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}
variable "profile" {
  description = "aws profile"
  type        = string
  default     = "aws-cent"
}
#############################
variable "cluster_name" {
  description = "name for the cluster"
  type        = string
  default     = "cluster_eks_mauro"
}
variable "cluster_version" {
  description = "version cluster"
  type        = string
  default     = "1.21"
}


