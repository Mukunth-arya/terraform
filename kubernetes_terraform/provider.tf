provider "google" {
  region      = "asia-south1"
  version     = "3.65"
  credentials = file("myfile.json")
}
resource "random_integer" "servers" {
  min = 100
  max = 1000000
}
