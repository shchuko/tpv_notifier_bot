import os
from io import BytesIO
import requests

import telebot

chat_id = os.environ.get('CHAT_ID')
token = os.environ.get('TOKEN')
image_url = 'https://raw.githubusercontent.com/shchuko/tpv_notifier_bot/master/images/out.jpg'


def notify(caption: str):
    bot = telebot.TeleBot(token)
    bot.send_chat_action(chat_id, 'upload_photo')
    img = BytesIO(requests.get(image_url).content)
    message = bot.send_photo(chat_id, img, caption)
    bot.pin_chat_message(chat_id, message.message_id)


def thursday_notifier_handler(event, context):
    notify("Дедлайн завтра в 23:59!")
    return {}


def friday_notifier_handler(event, context):
    notify("Дедлайн сегодня в 23:59!")
    return {}
