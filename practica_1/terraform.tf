resource "local_file" "productos" {
  content  = "lista de productos para el mes próximo"
  filename = "prodcutos.txt"
}