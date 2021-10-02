variable "token" {}

variable "chat_id" {}

variable "region" {
  default = "eu-west-1"
}

locals {
  lambda_src_dir  = "${path.module}/functions/tpv_notifier_lambda/"
  lambda_pip_cmd  = "pip install --target ${local.lambda_src_dir} -r ${local.lambda_src_dir}/requirements.txt"
  lambda_excludes = [
    "requirements.txt",
    ".gitignore",
  ]
  lambda_zip_path = "${path.module}/functions/tpv_notifier_lambda.zip"

  chat_id = var.chat_id
  token   = var.token


  thursday_cron_rule_october  = "cron(00 10 7,21 10 ? 2021)"
  thursday_cron_rule_november = "cron(00 10 4,18 11 ? 2021)"
  thursday_cron_rule_december = "cron(00 10 2,16 12 ? 2021)"

  friday_cron_rule_october  = "cron(00 10 8,22 10 ? 2021)"
  friday_cron_rule_november = "cron(00 10 5,19 11 ? 2021)"
  friday_cron_rule_december = "cron(00 10 3,17 12 ? 2021)"
}
