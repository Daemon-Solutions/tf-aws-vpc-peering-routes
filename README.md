tf-aws-vpc-peering-routes
=========================

Creates routes for peering a VPC,  - Terraform Module

Usage
-----

```js
module "peer_routes" {
  source             = "git::ssh://git@gogs.bashton.net/Bashton-Terraform-Modules/tf-aws-vpc-peering-routes.git"
  destionation_cidr  = "10.250.0.0/16"
  peer_connection_id = "pcx-7324a4cb"
  public_route_table = "${module.vpc.public_route_tables}"
  nat_route_tables   = "${module.vpc.nat_route_tables}"
}
```

Variables
---------

 - `destination_cidr` - CIDR block on the _remote_ side of the VPC peering connection
 - `peer_connection_id` - Resource ID of the VPC peering connection
 - `public_route_table` - Resource ID of the public routing table in your _local_ VPC
 - `nat_route_tables` - Resource ID of the NAT routing tables in your _local_ VPC

It's generally preferable to re-use the values from the upstream modules used to
create the VPC, to avoid "magic numbers".

Outputs
-------

_None_
