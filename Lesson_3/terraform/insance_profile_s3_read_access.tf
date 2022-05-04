resource "aws_iam_policy" "s3_read_access" {
  name        = "AllowInstnceReadAccessFromEc2"
  description = "Policy for instances that give read access to S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      { "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "s3:Get*",
                "s3:List*",
                "s3:Get*",
                "s3-object-lambda:Get*",
                "s3-object-lambda:List*"
        ],
        "Resource" : [
          "arn:aws:s3:::aws-developer-fundamentals-bucket",
          "arn:aws:s3:::aws-developer-fundamentals-bucket/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "s3_read_access" {
  name = "AllowInstnceReadAccessFromEc2"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
        Name = "my-web-server-access"
        Env = "Demo"
      }
}

resource "aws_iam_policy_attachment" "s3_read_policy" {
  name       = "S3-Read-from-MyWebServer"
  roles      = [aws_iam_role.s3_read_access.name]
  policy_arn = aws_iam_policy.s3_read_access.arn
}

resource "aws_iam_instance_profile" "s3_read_access" {
  name = "Read-S3-Permission-for-MyWebServer"
  role = aws_iam_role.s3_read_access.name
}
