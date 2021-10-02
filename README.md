# A bot helps you not to forget complete your TPV homework

"Notificator" Telegram bot wrapped with AWS Lambda which triggers by AWS CloudWatch cron rule.
Inspired by [alpyski_kitchen_bot](https://github.com/shchuko/alpyski_kitchen_bot)

To deploy, run:

```bash
terraform apply -var-file="secrets.tfvars"
```

Example of `secrets.tfvars`:

```hcl
token   = "<Telegram bot access token here>"
chat_id = "<Telegram chat ID here>"
```