locals {
  math       = 2 * 2         # Math operators: *, /, +, -, -<number>
  equality   = 2 != 2        # Equality operators: ==, != (Not Equal to)
  comparison = 2 > 1         # Comparison operators: <, <=, >, >=
  logical    = true || false # Boolean && = And || = OR

}

output "operators" {
  value = {
    math       = local.math
    equality   = local.equality
    comparison = local.comparison
    logical    = local.logical
  }
}
