resource "aws_vpc" "main" {
  cidr_block = var.aws_vpc_cidr
  tags = {
    Name = "${var.prefix}-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(var.aws_vpc_cidr, 8, 0)
  tags = {
    Name = "${var.prefix}-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.prefix}-igw"
  }
}

resource "aws_route" "internet" {
  route_table_id         = aws_vpc.main.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_ec2_transit_gateway" "tgw" {
  tags = {
    Name = "${var.prefix}-tgw"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "main" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.main.id
  subnet_ids         = [aws_subnet.main.id]
  tags = {
    Name = "${var.prefix}-tgw-attachment"
  }
}

resource "aws_route" "azure" {
  route_table_id         = aws_vpc.main.main_route_table_id
  destination_cidr_block = var.azure_spoke_vnet_cidr
  transit_gateway_id     = aws_ec2_transit_gateway.tgw.id
}

resource "aws_security_group" "main" {
  name   = "${var.prefix}-sg"
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.prefix}-sg"
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr, var.azure_spoke_vnet_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "vm" {
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = "t3.small"
  key_name                    = var.aws_keypair_name
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.main.id]
  tags = {
    Name = "${var.prefix}-vm"
  }
}
