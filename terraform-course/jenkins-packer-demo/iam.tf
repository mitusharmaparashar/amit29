resource "aws_iam_role" "jenkins-admin" {
  name               = "jenkins-admin"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "jenkins-admin" {
  name = "jenkins-admin"
  role = aws_iam_role.jenkins-admin.name
}

resource "aws_iam_role_policy" "admin-policy" {
  name = "jenkins-admin-role-policy"
  role = aws_iam_role.jenkins-admin.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}
