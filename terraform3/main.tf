
provider "google" {
  credentials = file("myfile.json")
  version     = "3.65"
  project     = "kuberpro-336213"
  region      = "us-central1"
  zone        = "us-central1-c"
}
#https://github.com/terraform-google-module/terraform-google-network
module "vpc" {
  source = "terraform-google-modules/network/google"
  version = "2.5.0"
  project_id = kuberpro-336213
  networkname = "main"
  routingmode = "REGIONAL"

  delete_default_internet_gateway_routes = "true"
  subnets = [
   {
     subnet_name   = "public"
     subnet_ip     = "192.168.43.0/24"
     subnet_region = "us-central1"
     subnet_private_access = "false"
     subnet_flow_logs = "false"
   },
   {
     subnet_name = "private"
     subnet_ip = "192.168.1.0/24"
     subnet_region = "us-central1"
     subnet_private_access = "false"
     subnet_flow_logs = "false"
   }
   ]

   routes = [
   {
     name = "myneworks"
     description = "here comes the network route"
     destination_range = "0.0.0.0/0"
     next_hop_internet = "true"
   }
]
