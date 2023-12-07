

# IAM Grupları oluşturma
resource "aws_iam_group" "development_group" {
  name = "development-group"
}

resource "aws_iam_group" "operations_group" {
  name = "operations-group"
}

# IAM Kullanıcıları oluşturma
resource "aws_iam_user" "developer_user" {
  name = "developer-user"
}

resource "aws_iam_user" "operations_user" {
  name = "operations-user"
}

# IAM Kullanıcılarını Gruplara Atama
resource "aws_iam_user_group_membership" "developer_membership" {
  user  = aws_iam_user.developer_user.name
  groups = [aws_iam_group.development_group.name]
}

resource "aws_iam_user_group_membership" "operations_membership" {
  user  = aws_iam_user.operations_user.name
  groups = [aws_iam_group.operations_group.name]
}

# IAM Policy oluşturma (development grubu için)
resource "aws_iam_policy" "development_policy" {
  name        = "development-policy"
  description = "Development group policy"

  # Örnek bir politika - S3 tam erişim
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}
EOF
}

# IAM Policy oluşturma (operations grubu için)
resource "aws_iam_policy" "operations_policy" {
  name        = "operations-policy"
  description = "Operations group policy"

  # Örnek bir politika - EC2 tam erişim
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:*",
      "Resource": "*"
    }
  ]
}
EOF
}

# IAM Policy oluşturma (RDS için)
resource "aws_iam_policy" "rds_policy" {
  name        = "rds-policy"
  description = "RDS access policy"

  # Örnek bir politika - RDS tam erişim
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "rds:*",
      "Resource": "*"
    }
  ]
}
EOF
}

# IAM Policy'leri Gruplara Atama
resource "aws_iam_group_policy_attachment" "development_attachment" {
  group      = aws_iam_group.development_group.name
  policy_arn = aws_iam_policy.development_policy.arn
}

resource "aws_iam_group_policy_attachment" "operations_attachment" {
  group      = aws_iam_group.operations_group.name
  policy_arn = aws_iam_policy.operations_policy.arn
}

resource "aws_iam_group_policy_attachment" "rds_attachment" {
  group      = aws_iam_group.operations_group.name
  policy_arn = aws_iam_policy.rds_policy.arn
}
