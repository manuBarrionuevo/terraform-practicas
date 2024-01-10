resource "local_file" "productos-1" {
  count = 5
  content = "lista de productos para el mes próximo"
  filename = "prodcutos-${random_string.sufijo[count.index].id}.txt"
}

