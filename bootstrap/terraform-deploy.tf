data "aws_iam_policy_document" "github_terraform_trust" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [data.aws_iam_openid_connect_provider.github.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:Wutang-Dev@256145436/rg-lab-tracker-ecs@1453702448:ref:refs/heads/main"]
    }
  }
}


resource "aws_iam_role_policy" "github_terraform_state" {
  name = "rg-lab-tracker-terraform-state-access"
  role = aws_iam_role.github_terraform_deploy.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "ListTerraformStateBucket"
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = "arn:aws:s3:::rg-lab-tracker-terraform-state"
      },
      {
        Sid    = "ManageTerraformState"
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]

        Resource = "arn:aws:s3:::rg-lab-tracker-terraform-state/terraform.tfstate"
      },
      {
        Sid    = "ManageTerraformStateLock"
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]

        Resource = "arn:aws:s3:::rg-lab-tracker-terraform-state/terraform.tfstate.tflock"
      }
    ]
  })
}
resource "aws_iam_role" "github_terraform_deploy" {
  name               = "rg-lab-tracker-github-terraform-deploy"
  assume_role_policy = data.aws_iam_policy_document.github_terraform_trust.json

  tags = {
    project    = "rg-lab-tracker-ecs"
    managed_by = "terraform"
    purpose    = "GitHub-Actions-OIDC"
  }
}
resource "aws_iam_role_policy_attachment" "github_terraform_deploy" {
  role       = aws_iam_role.github_terraform_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}