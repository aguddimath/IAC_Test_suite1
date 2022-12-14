resource "aws_iam_user" "test_user" {
  name = "test-user"
}

resource "aws_iam_policy" "test_policy" {
  name        = "test-policy"
  description = "A test policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user_policy_attachment" "testattachment" {
  user       = aws_iam_user.test_user.name
  policy_arn = aws_iam_policy.test_policy.arn
}
