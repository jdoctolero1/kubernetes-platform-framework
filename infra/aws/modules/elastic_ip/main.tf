resource "aws_eip" "this" {
  domain = "vpc"

  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_eip_association" "this" {
  count = var.instance_id != null || var.network_interface_id != null ? 1 : 0

  allocation_id        = aws_eip.this.id
  instance_id          = var.network_interface_id == null ? var.instance_id : null
  network_interface_id = var.network_interface_id
}
