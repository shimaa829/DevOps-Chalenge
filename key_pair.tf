resource "tls_private_key" "example" {
  algorithm   = "RSA"
  rsa_bits = "2048"
}

// to create secret key on AWS but it is empty 
resource "aws_secretsmanager_secret" "privateaws" {
  name = "private_keyaws"
}

// to save the private key value to the genetrated secrete key on aws 
resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = "${aws_secretsmanager_secret.privateaws.id}"
  secret_string = "${tls_private_key.example.private_key.pem}"


  // provisioner to run command after create the resource:

 provisioner "local-exec" {
    command = "aws secretsmanager  >> private_key.pem"
    interpreter = [ "/bin/bash", "-c"]
  }


}


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${tls_private_key.example.public_key_openssh}"
}