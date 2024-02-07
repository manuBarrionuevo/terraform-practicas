locals {
  sufix = "${var.tags.project}-${var.tags.environmet}-${var.tags.region}" #recurso-proyecto-env-region
}

resource "random_string" "sufijo_s3" {
  length  = 8
  special = false
  upper   = false
}

locals {
  s3-sufix = "${var.tags.project}-${random_string.sufijo_s3.id}"
}