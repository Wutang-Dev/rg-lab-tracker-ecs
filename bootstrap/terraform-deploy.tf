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

resource "aws_iam_role" "github_terraform_deploy" {
  name               = "rg-lab-tracker-github-terraform-deploy"
  assume_role_policy = data.aws_iam_policy_document.github_terraform_trust.json
}