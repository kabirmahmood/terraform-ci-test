module "subnet_addrs" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = var.vpc_cidr
  networks = [
    {
      name     = "subnet1"
      new_bits = var.new_bits
    },
    {
      name     = "subnet2"
      new_bits = var.new_bits
    },
    {
      name     = "subnet3"
      new_bits = var.new_bits
    },
  ]
}

output "cidr_blocks" {
    value = "${module.subnet_addrs.network_cidr_blocks}"
}

variable "items" {
  default = ["item1", "item2"]
}

resource "null_resource" "loop_list" {
  provisioner "local-exec" {
    command     = "for item in $ITEMS; do echo $item >> test-file; done"
    environment = { ITEMS = join(" ", var.items) }
  }
}
