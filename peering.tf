resource "aws_vpc_peering_connection" "peer" {
    count = var.is_peering_required ? 1 : 0
    peer_vpc_id   = data.aws_vpc.default.id # accepter VPC ID
    vpc_id        = aws_vpc.main.id # requester VPC I
    auto_accept   = true 
    accepter {
        allow_remote_vpc_dns_resolution = true
    }
    requester {
        allow_remote_vpc_dns_resolution = true
    }


  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-default"
    },
    var.peering_tags
  )
}