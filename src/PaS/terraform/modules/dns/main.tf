data "local_file" "tsig_secret" {
  filename = "${var.tsig_file}"
}