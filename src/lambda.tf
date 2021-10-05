resource "null_resource" "lambda_invoke_pip" {
  provisioner "local-exec" {
    command = local.lambda_pip_cmd
  }
}

data "archive_file" "lambda_zip" {
  output_path = local.lambda_zip_path
  type        = "zip"

  source_dir = local.lambda_src_dir
  excludes   = local.lambda_excludes
  depends_on = [null_resource.lambda_invoke_pip]
}

resource "aws_lambda_function" "thursday_notifier_lambda" {
  function_name = "thursday_notifier_lambda"
  filename      = data.archive_file.lambda_zip.output_path
  role          = aws_iam_role.lambda_execution.arn
  handler       = "tpv_notifier_lambda.thursday_notifier_handler"

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.8"

  environment {
    variables = {
      CHAT_ID = local.chat_id
      TOKEN   = local.token
    }
  }
}

resource "aws_lambda_function" "friday_notifier_lambda" {
  function_name = "friday_notifier_lambda"
  filename      = data.archive_file.lambda_zip.output_path
  role          = aws_iam_role.lambda_execution.arn
  handler       = "tpv_notifier_lambda.friday_notifier_handler"

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.8"

  environment {
    variables = {
      CHAT_ID = local.chat_id
      TOKEN   = local.token
    }
  }
}

resource "aws_lambda_permission" "allow_thursday_cloudwatch_october" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.thursday_notifier_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.thursday_lambda_october.arn
}

resource "aws_lambda_permission" "allow_thursday_cloudwatch_november" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.thursday_notifier_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.thursday_lambda_november.arn
}


resource "aws_lambda_permission" "allow_thursday_cloudwatch_december" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.thursday_notifier_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.thursday_lambda_december.arn
}

resource "aws_lambda_permission" "allow_friday_cloudwatch_october" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.friday_notifier_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.friday_lambda_october.arn
}

resource "aws_lambda_permission" "allow_friday_cloudwatch_november" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.friday_notifier_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.friday_lambda_november.arn
}

resource "aws_lambda_permission" "allow_friday_cloudwatch_december" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.friday_notifier_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.friday_lambda_december.arn
}