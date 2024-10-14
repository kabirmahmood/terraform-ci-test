terraform {
  source = "../module/"
}

inputs = {
  vpc_cidr = "10.0.0.0/16"
  new_bits = 8
}
