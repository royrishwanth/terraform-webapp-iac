resource "aws_vpc" "myvpc1" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_eip" "natgwip" {
  tags = {
    Name = "demo-nat-eip"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc1.id
  tags = {
    Name = "demo-internet-gateway"
  }

}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.natgwip.id
  subnet_id     = aws_subnet.public_subnet1.id
  tags = {
    Name = "demo-nat-gateway"
  }

}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.myvpc1.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = var.az1
  tags = {
    Name = "demo-private-subnet1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.myvpc1.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = var.az2
  tags = {
    Name = "demo-private-subnet2"

  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.myvpc1.id
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = var.az1
  map_public_ip_on_launch = true
  tags = {
    Name = "demo-public-subnet1"

  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.myvpc1.id
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = var.az2
  map_public_ip_on_launch = true
  tags = {
    Name = "demo-public-subnet2"

  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.myvpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  }

  tags = {
    Name = "demo-public-route-table"
  }
}

resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rta2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id

}

resource "aws_route_table" "pvt_rt" {
  vpc_id = aws_vpc.myvpc1.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id

  }
  tags = {
    Name = "demo-private-route-table"
  }

}
resource "aws_route_table_association" "private_rta1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.pvt_rt.id
}
resource "aws_route_table_association" "private_rta2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.pvt_rt.id
}


