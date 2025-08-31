resource "aws_vpc" "this" {
cidr_block = var.vpc_cidr
tags = { Name = "${var.name}-vpc" }
}


resource "aws_internet_gateway" "igw" {
vpc_id = aws_vpc.this.id
}


resource "aws_subnet" "public" {
for_each = { for idx, cidr in var.public_subnet_cidrs : idx => cidr }
vpc_id = aws_vpc.this.id
cidr_block = each.value
map_public_ip_on_launch = true
availability_zone = element(data.aws_availability_zones.available.names, each.key)
}


data "aws_availability_zones" "available" {}


resource "aws_route_table" "public" {
vpc_id = aws_vpc.this.id
}


resource "aws_route" "public_inet" {
route_table_id = aws_route_table.public.id
destination_cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id
}


resource "aws_route_table_association" "public_assoc" {
for_each = aws_subnet.public
subnet_id = each.value.id
route_table_id = aws_route_table.public.id
}
