resource "aws_route" "peer_public" {
  destination_cidr_block    = "${var.destionation_cidr}"
  vpc_peering_connection_id = "${var.peer_connection_id}"
  route_table_id            = "${var.public_route_table}"
}

resource "aws_route" "peer_nat" {
  count                     = "${length(split(",", var.nat_route_tables))}"
  destination_cidr_block    = "${var.destionation_cidr}"
  vpc_peering_connection_id = "${var.peer_connection_id}"
  route_table_id            = "${element(split(",", var.nat_route_tables), count.index)}"
}
