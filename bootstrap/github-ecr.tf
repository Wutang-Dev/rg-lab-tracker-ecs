data "aws_iam_policy_document" "github_ecr_trust" {
  statement {
    effect  = "Allow"
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
      values   = ["repo:Wutang-Dev/rg-lab-tracker-ecs:ref:refs/heads/main"]
    }
  }
}
resource "aws_iam_role" "github_ecr" {
  name               = "rg-lab-tracker-github-ecr-push"
  assume_role_policy = data.aws_iam_policy_document.github_ecr_trust.json

  tags = {
    Project   = "rg-lab-tracker-ecs"
    ManagedBy = "Terraform"
    Purpose   = "GitHub-Actions-ECR"
  }
}
data "aws_iam_policy_document" "github_ecr_permissions" {
  statement {
    sid       = "ECRAuthentication"
    effect    = "Allow"
    actions   = ["ecr:GetAuthorizationToken"]
    resources = ["*"]
  }

  statement {
    sid    = "ECRPush"
    effect = "Allow"

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart",
      "ecr:BatchGetImage"
    ]

    resources = [
      "arn:aws:ecr:eu-north-1:345471468677:repository/ecs-rg-lab-tracker"
    ]
  }
}
resource "aws_iam_role_policy" "github_ecr_push" {
  name = "rg-lab-tracker-github-ecr-policy"

  role   = aws_iam_role.github_ecr.id
  policy = data.aws_iam_policy_document.github_ecr_permissions.json
}