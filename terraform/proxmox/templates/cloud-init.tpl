#cloud-config
hostname: ${name}
manage_etc_hosts: true

package_update: true
package_upgrade: true
package_reboot_if_required: true

#resize disk and growfs
bootcmd:
  - [ cloud-init-per, once, resizedisk, /usr/local/sbin/resizelvm ]

# Write the /etc/hosts file
write_files:
  - path: /etc/hosts
    content: |
      127.0.0.1    localhost
      ::1          localhost

users:
  - name: sysadmin
    gecos: Sysadmin
    groups: [adm, systemd-journal]
    passwd: "$6$v2XtjjK1lIIu6z7u$ECqJ3PHeyTkjZtPtNWubB6GJ5puS598hyY1a11fxGw0sjUocJ0IJEYAKt6JTcP7vWjr0YeVZ0B55odyt474es/"
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    shell: /bin/bash
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhXN/l2q5lVcWw2kRhKHTiZ9LNalskpwy4y2WubbMDc0fzN1QeXhfI7oy9YRj/VTthN6O8zIQgWGHk3g4Mt2FwJIx+jcWmiWTsfhwsEZu3KUgDMBRQzPTm8gs1ep54ID07/Bs1hCRgrJco7uiKbE+iGIgkiWOlprmc3kvqXnZv347DpUYsJ8b9K3d3rYZELgPYuFiVj495AKOHqVThQW5MOSGBDLDHwZoCHQL7g2eTE5Q3dbK6bzzU8O+Z7rVYJLc1CzK4VlCxDgYe2fq6LNDwFPDnNSYK0BH1L4mSPQ+mSkYXI68TlcMT6pvuO0Jt9S+qPWPyjr51dkOzhZbBEx6qhQ6DIJDsZ8YphAv0Bx8clwVP322pL3c9mLyr1hoyJy5ptjVR6XQ/6XWXZZnQc9CcD9qAt+Oh6Z8bRAl8ZuD3or9LS9PNYDMvUQe0gghDUv+GKhGxxnI2CMgQtf7hjibkGhJpKMMNCmC/6FgmobgaVv50b3NgUrVlVKNX10ypHxqFeypB4p17XnycoVXreOecXzV+8rCPrpMGKTB9VHxH7hXoUfYz8mec7c3bU9Ecb0NJexU2LxXACzK0HePmwG1At2D9tVsLQN02ems95TctOuUCtxRQYBKGZJ7JUVbCnB0pzEYkXKbVesB6aOMtbyug0dONvrU5fWicUxO4y2pjGw== jaok@softwaremind.com
