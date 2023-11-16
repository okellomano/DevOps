resource "aws_instance" "web_instance_1" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [ aws_security_group.instances.name ]
  user_data = <<-EOF
    #!/bin/bash
    echo "My profile one" > index.html
    python3 -m http.server 8080 &
    EOF
}

resource "aws_instance" "web_instance_2" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [ aws_security_group.instances.name ]
  user_data = <<-EOF
    #!/bin/bash
    echo "My profile two" > index.html
    python3 -m http.server 8080 &
    EOF
}