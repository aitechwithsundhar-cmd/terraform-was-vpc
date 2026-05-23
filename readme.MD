Terraform AWS VPC Module

This Terraform module creates a reusable AWS VPC infrastructure with support for networking, routing, NAT Gateway, and optional VPC peering.

⸻

Resources Created

This module creates the following resources:

1. VPC
2. Internet Gateway (IGW) with VPC association
3. Public Subnets
4. Private Subnets
5. Database Subnets
6. Public Route Table
7. Private Route Table
8. Database Route Table
9. Route Table Associations
10. Public Route to Internet Gateway
11. Elastic IP (EIP)
12. NAT Gateway
13. Private and Database routes through NAT Gateway
14. VPC Peering with Default VPC (optional)
15. Route entries for VPC Peering

⸻

Architecture

Internet
    |
    V
Internet Gateway
    |
    V
-------------------------
|        VPC            |
|                       |
|  Public Subnets       |
|      |                |
|      V                |
|  NAT Gateway          |
|      |                |
|      V                |
| Private Subnets       |
| Database Subnets      |
|                       |
-------------------------
         |
         |
         V
Default VPC (Optional Peering)

⸻

Requirements

Name	Version
Terraform	>= 1.0
AWS Provider	6.35.1

⸻

Usage

module "vpc" {
  source = "git::https://github.com/aitechwithsundhar-cmd/terraform-aws-vpc.git?ref=main"
  project = "roboshop"
  environment = "dev"
  vpc_cidr = "10.0.0.0/16"
  is_peering_required = true
}

⸻

## Inputs

| Name | Description | Type | Required | Default |
|-------|-------------|------|----------|---------|
| project | Project name | string | Yes | N/A |
| environment | Environment name | string | Yes | N/A |
| vpc_cidr | VPC CIDR block | string | No | `"10.0.0.0/16"` |
| vpc_tags | Additional VPC tags | map(string) | No | `{}` |
| igw_tags | Additional Internet Gateway tags | map(string) | No | `{}` |
| public_subnet_cidrs | Public subnet CIDRs | list(string) | No | `["10.0.1.0/24","10.0.2.0/24"]` |
| public_subnet_tags | Public subnet tags | map(string) | No | `{}` |
| private_subnet_cidrs | Private subnet CIDRs | list(string) | No | `["10.0.11.0/24","10.0.12.0/24"]` |
| private_subnet_tags | Private subnet tags | map(string) | No | `{}` |
| database_subnet_cidrs | Database subnet CIDRs | list(string) | No | `["10.0.21.0/24","10.0.22.0/24"]` |
| database_subnet_tags | Database subnet tags | map(string) | No | `{}` |
| public_route_table_tags | Public route table tags | map(string) | No | `{}` |
| private_route_table_tags | Private route table tags | map(string) | No | `{}` |
| database_route_table_tags | Database route table tags | map(string) | No | `{}` |
| eip_tags | Elastic IP tags | map(string) | No | `{}` |
| nat_gateway_tags | NAT Gateway tags | map(string) | No | `{}` |
| peering_tags | VPC peering tags | map(string) | No | `{}` |
| is_peering_required | Enable VPC peering | bool | No | `false` |

---

## Outputs

| Name | Description |
|-------|-------------|
| azs_info | Availability Zone information |
| vpc_id | Created VPC ID |
| public_subnet_ids | Public subnet IDs |
| private_subnet_ids | Private subnet IDs |
| database_subnet_ids | Database subnet IDs |
| internet_gateway_id | Internet Gateway ID |
| nat_gateway_id | NAT Gateway ID |
| peering_connection_id | VPC Peering connection ID |

⸻

Example

module "vpc" {
  source = "git::https://github.com/aitechwithsundhar-cmd/terraform-aws-vpc.git?ref=main"
  project = "roboshop"
  environment = "dev"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
  private_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
  database_subnet_cidrs = [
    "10.0.21.0/24",
    "10.0.22.0/24"
  ]
  is_peering_required = true
}

⸻

Author

Ajmera Sundhar

Building DevOps projects using Terraform and AWS 🚀
