locals {
  name = "Greg East"
  age  = 30
  my_object = {
    key1 = 10
    key2 = "my_value"
  }
}

output "example1" {
  value = upper(local.name)

}

output "example2" {
  value = startswith(lower(local.name), "sach")

}

output "example3" {
  value = yamldecode(file("${path.module}/users.yaml")).users

}

output "example4" {
  value = yamldecode(file("${path.module}/users.yaml")).users[*].name

}

output "example5" {
  value = yamlencode(local.my_object)

}

output "example6" {
  value = jsonencode(local.my_object)

}
