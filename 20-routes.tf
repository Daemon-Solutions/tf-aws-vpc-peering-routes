resource "aws_route" "peer_public" {
  destination_cidr_block    = "${var.destination_cidr}"
  vpc_peering_connection_id = "${var.peer_connection_id}"
  route_table_id            = "${var.public_route_table}"
}

/*
 * Hacky workaround is hacky - see:
 * https://github.com/hashicorp/terraform/issues/2301
 * https://github.com/hashicorp/terraform/issues/7741
 */
resource "aws_route" "peer_nat_a" {
  destination_cidr_block    = "${var.destination_cidr}"
  vpc_peering_connection_id = "${var.peer_connection_id}"
  route_table_id            = "${element(split(",", var.nat_route_tables), 0)}"
}

resource "aws_route" "peer_nat_b" {
  destination_cidr_block    = "${var.destination_cidr}"
  vpc_peering_connection_id = "${var.peer_connection_id}"
  route_table_id            = "${element(split(",", var.nat_route_tables), 1)}"
}

resource "aws_route" "peer_nat_c" {
  count                     = "${var.create_third_route}"
  destination_cidr_block    = "${var.destination_cidr}"
  vpc_peering_connection_id = "${var.peer_connection_id}"
  route_table_id            = "${element(split(",", var.nat_route_tables), 2)}"
}
