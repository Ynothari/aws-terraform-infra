provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "example_user" {
  name = "terraform-example-user"
}

resource "aws_iam_policy" "example_policy" {
  name        = "terraform-example-policy"
  description = "Example policy with read-only S3 access"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = [
        "s3:Get*",
        "s3:List*"
      ]
      Effect   = "Allow"
      Resource = "*"
    }]
  })
}

resource "aws_iam_user_policy_attachment" "example_attach" {
  user       = aws_iam_user.example_user.name
  policy_arn = aws_iam_policy.example_policy.arn
}

resource "aws_instance" "example_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 in us-east-1
  instance_type = "t2.micro"
  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-example-bucket-715841351740"
}

