locals {
  example_string = "Hello, World!"
  csv_values = "apple,banana,cherry"
  nested_list = [["apple", "banana"], ["cherry", "date"]]
  list_one = ["apple", "banana"]
  list_two = ["cherry", "date"]
}

/*variable "list_one" {
  default = ["apple", "banana"]
}

variable "list_two" {
  default = ["cherry", "date"]
}*/

# Concaténation des deux listes
output "combined_list" {
  value = concat(local.list_one, local.list_two)
}


# Flatten la liste
output "flattened_list" {
  value = flatten(local.nested_list)
}

variable "brokers" {
  type = list
  default = ["1.1.1.1", "2.2.2.2", "3.3.3.3"]
}

# Remplace "World" par "Terraform"
output "replaced_string" {
  value = replace(local.example_string, "World", "Terraform")
}

# Usage d'expressions régulières pour remplacer
output "replaced_regex" {
  value = replace(local.example_string, "/World/", "Terraform")
}


# Split par une virgule
output "split_list" {
  value = split(",", local.csv_values)
}

output "broker_list" {
    value = join(",", [for ip in var.brokers: "${ip}:9092"])
}