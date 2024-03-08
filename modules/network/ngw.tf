resource "aws_eip" "eks_ngw_eip_la" {
  domain = "vpc"
  tags = merge(
    var.tags, {
      Name = "${var.project_name}-eip-1a"
    }
  )
}

resource "aws_eip" "eks_ngw_eip_lb" {
  domain = "vpc"
  tags = merge(
    var.tags, {
      Name = "${var.project_name}-eip-1b"
    }
  )
}

resource "aws_eip" "eks_ngw_eip_lc" {
  domain = "vpc"
  tags = merge(
    var.tags, {
      Name = "${var.project_name}-eip-1c"
    }
  )
}

resource "aws_nat_gateway" "eks_ngw_1a" {
  allocation_id = aws_eip.eks_ngw_eip_la.id
  subnet_id     = aws_subnet.eks_subnet_public_1a.id

  tags = merge(
    var.tags, {
      Name = "${var.project_name}-ngw-1a"
    }
  )
}

resource "aws_nat_gateway" "eks_ngw_1b" {
  allocation_id = aws_eip.eks_ngw_eip_lb.id
  subnet_id     = aws_subnet.eks_subnet_public_1b.id

  tags = merge(
    var.tags, {
      Name = "${var.project_name}-ngw-1b"
    }
  )
}

resource "aws_nat_gateway" "eks_ngw_1c" {
  allocation_id = aws_eip.eks_ngw_eip_lc.id
  subnet_id     = aws_subnet.eks_subnet_public_1c.id

  tags = merge(
    var.tags, {
      Name = "${var.project_name}-ngw-1b"
    }
  )
}

resource "aws_route_table" "eks_private_route_table_1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1a.id
  }

  tags = merge(
    var.tags, {
      Name = "${var.project_name}-priv-route-table-1a"
    }
  )
}

resource "aws_route_table" "eks_private_route_table_1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1b.id
  }

  tags = merge(
    var.tags, {
      Name = "${var.project_name}-priv-route-table-1b"
    }
  )
}

resource "aws_route_table" "eks_private_route_table_1c" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1c.id
  }

  tags = merge(
    var.tags, {
      Name = "${var.project_name}-priv-route-table-1c"
    }
  )
}