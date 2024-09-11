require 'telegram/bot'

API = "7254953350:AAF_v3NCYfxwsmeoG7JegqSvvwX2iMtjgg4"

Telegram::Bot::Client.run(API) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', 'назад'
      keyboard = [
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Начать заработать💰')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Связаться с нами :)')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Отзывы')]
      ]

      reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
        keyboard: keyboard,
        resize_keyboard: true,
        one_time_keyboard: false
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Выберите опцию:",
        reply_markup: reply_markup
      )

    when 'Связаться с нами :)'
      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Связаться', url: 'https://t.me/godblsdme')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [kb])

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "В случае возникновения проблем или вопросов пишите сюда. Наша служба поддержки всегда рада вам помочь! :)", # Можно использовать пустую строку или пробел
        reply_markup: markup
      )

    when 'Начать заработать💰'

      # Показ новой кнопки "Заработать"
      keyboard = [
        [Telegram::Bot::Types::KeyboardButton.new(text: 'До 14 лет')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'с 14 лет')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'с 18 лет')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'назад')]
      ]

      reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
        keyboard: keyboard,
        resize_keyboard: true,
        one_time_keyboard: false
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Выберите подходящий вариант, чтобы мы могли определить, какие реферальные программы подходят именно для вас:",
        reply_markup: reply_markup
      )

    when 'Отзывы'

      keyboard = [
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Оставить отзыв')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Смотреть отзывы')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'назад')]
      ]

      reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
        keyboard: keyboard,
        resize_keyboard: true,
        one_time_keyboard: false
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Выберите опцию:",
        reply_markup: reply_markup
      )
    when 'Смотреть отзывы'

      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Смотреть отзывы', url: 'https://t.me/+nITg496t6cNmN2Uy')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [kb])

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Отзывы и доказательства выплат всегда можно посмотреть тут:",
        reply_markup: markup
      )

    when 'Оставить отзыв'

      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Оставить отзыв', url: 'https://t.me/godblsdme')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [kb])

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Оставить отзыв можно здесь, позже администратор его опубликует :)",
        reply_markup: markup
      )

    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Я вас не понял"
      )
    end
  end
end
