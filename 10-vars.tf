variable "destination_cidr"   {}
variable "peer_connection_id" {}
variable "public_route_table" {}
variable "nat_route_tables"   {}

variable "create_third_route" {
  default = 1
}
