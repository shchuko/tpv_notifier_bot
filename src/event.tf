resource "aws_cloudwatch_event_rule" "thursday_lambda_october" {
  schedule_expression = local.thursday_cron_rule_october
}

resource "aws_cloudwatch_event_rule" "thursday_lambda_november" {
  schedule_expression = local.thursday_cron_rule_november
}

resource "aws_cloudwatch_event_rule" "thursday_lambda_december" {
  schedule_expression = local.thursday_cron_rule_december
}

resource "aws_cloudwatch_event_rule" "friday_lambda_october" {
  schedule_expression = local.friday_cron_rule_october
}

resource "aws_cloudwatch_event_rule" "friday_lambda_november" {
  schedule_expression = local.friday_cron_rule_november
}

resource "aws_cloudwatch_event_rule" "friday_lambda_december" {
  schedule_expression = local.friday_cron_rule_december
}

resource "aws_cloudwatch_event_target" "thursday_lambda_october" {
  rule      = aws_cloudwatch_event_rule.thursday_lambda_october.name
  target_id = "InvokeThursdayLambdaOctober"
  arn       = aws_lambda_function.thursday_notifier_lambda.arn
}

resource "aws_cloudwatch_event_target" "thursday_lambda_november" {
  rule      = aws_cloudwatch_event_rule.thursday_lambda_november.name
  target_id = "InvokeThursdayLambdaNovember"
  arn       = aws_lambda_function.thursday_notifier_lambda.arn
}

resource "aws_cloudwatch_event_target" "thursday_lambda_december" {
  rule      = aws_cloudwatch_event_rule.thursday_lambda_december.name
  target_id = "InvokeThursdayLambdaDecember"
  arn       = aws_lambda_function.thursday_notifier_lambda.arn
}

resource "aws_cloudwatch_event_target" "friday_lambda_october" {
  rule      = aws_cloudwatch_event_rule.friday_lambda_october.name
  target_id = "InvokeFridayLambdaOctober"
  arn       = aws_lambda_function.friday_notifier_lambda.arn
}

resource "aws_cloudwatch_event_target" "friday_lambda_november" {
  rule      = aws_cloudwatch_event_rule.friday_lambda_november.name
  target_id = "InvokeFridayLambdaNovember"
  arn       = aws_lambda_function.friday_notifier_lambda.arn
}

resource "aws_cloudwatch_event_target" "friday_lambda_december" {
  rule      = aws_cloudwatch_event_rule.friday_lambda_december.name
  target_id = "InvokeFridayLambdaDecember"
  arn       = aws_lambda_function.friday_notifier_lambda.arn
}