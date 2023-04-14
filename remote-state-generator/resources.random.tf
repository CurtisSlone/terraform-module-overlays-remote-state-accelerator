# Generate a random storage name
resource "random_string" "rand" {
  length = 5
  upper = true
  numeric = false
  lower = true
  special = false
}