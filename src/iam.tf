data "aws_iam_policy_document" "lambda_execution" {
  version = "2012-10-17"

  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    sid     = ""

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "lambda_execution" {
  assume_role_policy = data.aws_iam_policy_document.lambda_execution.json
}