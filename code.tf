provider "aws" {
  region     = "ap-south-1"
  
}

resource "aws_instance" "web" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  count         = 1

  tags = {
    Name = "synced-code"
  }
}

resource "aws_instance" "db" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  count         = 1

  tags = {
    Name = "code-synced"
  }
}



terraform {
  backend "s3" {
    bucket = "nileshterraform11"
    key    = "project"
    region = "ap-south-1"
    access_key = "AKIAW6DHWWT6VAK4Y64V"
    secret_key = "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"
    dynamodb_table ="nileshDB"

}
}

