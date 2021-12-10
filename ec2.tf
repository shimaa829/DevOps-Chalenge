
resource "aws_instance" "app-ec21" {
  
  ami = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.pubsub1.id}"
  key_name = "${aws_key_pair.deployer.id}"
  # vpc_security_group_ids = ["${aws_security_group.dis_allow_ssh.id}",
  #                           "${aws_security_group.allow_http.id}",
  #                          ]
  tags = {
    Name = "Jumia1"
  }

}


resource "aws_instance" "app-ec22" {
  
  ami = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.pubsub2.id}"
  key_name = "${aws_key_pair.deployer.id}"
  # vpc_security_group_ids = ["${aws_security_group.dis_allow_ssh.id}",
  #                           "${aws_security_group.allow_http.id}",
  #                          ]
  tags = {
    Name = "Jumia2"
  }

}

resource "aws_lb" "LB" {
  name               = "lb-tf"
  internal           = false
  load_balancer_type = "application"
  # security_groups    = [aws_security_group.lb_sg.id]
  # subnets            = [for subnet in aws_subnet.public : subnet.id]

  # enable_deletion_protection = true

  # access_logs {
  #   bucket  = aws_s3_bucket.lb_logs.bucket
  #   prefix  = "test-lb"
  #   enabled = true
  # }

  tags = {
    Environment = "production"
  }
}
resource "aws_instance" "bastian-ec23" {
  
  ami = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.pubsub1.id}"
  key_name = "${aws_key_pair.deployer.id}"
  # vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]

  tags = {
    Name = "bastian"
  }

}

 resource "aws_db_instance" "db-ec24" {
   allocated_storage    = 10
  engine               = "PostgreSQL"
  engine_version       = "5.7"
  instance_class = "db.t3.micro"
  subnet_id     = "${aws_subnet.privsub1.id}"
  key_name = "${aws_key_pair.deployer.id}"
  # vpc_security_group_ids = ["${aws_security_group.dis_allow_ssh.id}"]

  tags = {
    Name = "RDS1"
  }

}


resource "aws_db_instance" "db-ec25"{
  allocated_storage    = 10
  engine               = "PostgreSQL"
  engine_version       = "5.7"
  instance_class  = "db.t3.micro"
  subnet_id     = "${aws_subnet.privsub2.id}"
  # key_name = "${aws_key_pair.deployer.id}"
  # vpc_security_group_ids = ["${aws_security_group.dis_allow_ssh.id}"]

  tags = {
    Name = "RDS2"
  }
  

}