resource "local_file" "cloud_init" {
  for_each = var.servers

  filename = "generated/${each.value.name}-cloud-init.yaml"
  content  = templatefile("templates/cloud-init.tpl", {
    name    = each.value.name
  })
}

resource "null_resource" "upload_cloud_init" {
  for_each = var.servers

  connection {
    type    = "ssh"
    user    = var.ssh_user
    host    = var.ssh_host
  }

  provisioner "file" {
    source      = local_file.cloud_init[each.key].filename
    destination = "/mnt/pve/cephfs/snippets/${each.value.name}-cloud-init.yaml"
  }
}
