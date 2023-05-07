resource "tls_private_key" "privkey" {
    count = var.createprivkey ? 1 : 0
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "aws_key_pair" "key" {
    count = var.createprivkey ? 1 : 0
    key_name = var.key_name
    public_key = tls_private_key.privkey[0].public_key_openssh
    tags = var.tags
}

resource "aws_key_pair" "keywithinput" {
    count = var.passpublickey ? 1 : 0
    key_name = var.key_name
    public_key = var.public_key
    tags = var.tags
}