require 'telegram/bot'

API = "7254953350:AAF_v3NCYfxwsmeoG7JegqSvvwX2iMtjgg4"

Telegram::Bot::Client.run(API) do |bot|
  bot.listen do |message|
    if message.is_a?(Telegram::Bot::Types::Message) && message.text
      begin
    case message.text
    when '/start', 'Назад'
      keyboard = [
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Начать заработать💰')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Связаться с нами💬')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Отзывы💭')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Интсрукция по оформлению📖')]
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

    when 'Связаться с нами💬'
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
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Дебетовки с 14 лет👦')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Дебетовки с 18 лет👨‍🦱')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Кредитки с 18 лет👨‍🦱')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
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

    when 'Дебетовки с 14 лет👦'

      keyboard = [
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Показать еще карты💳')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
      ]

      reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
        keyboard: keyboard,
        resize_keyboard: true,
        one_time_keyboard: false
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "
        https://trk.ppdu.ru/click/Lqv93Dty?erid=Kra23bfT9

-ВТБ - Дебетовая карта МИР

-ВЫ ЗАРАБОТАЙТЕ: (1140₽)

-Целевое действие:
  Дебетовая карта – выдача + POS-транзакция на любую сумму

-СВЯЗАТЬСЯ: @godblsdme

         ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/DfMG115b?erid=Kra246EPA

-Альфа - Банк - Дебетовая Альфа-карта МИР

-ВЫ ЗАРАБОТАЙТЕ: (666₽)

-Целевое действие:
 Активированная карта – карта, по которой была совершена расходная операция по пластиковой карте
  (только покупка) в течение 90 дней после получения. Но есть список расходных операций-исключений.

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/J71BIGpi?erid=Kra23xCCG

-Т-Банк - Дебетовая карта Black МИР

-ВЫ ЗАРАБОТАЙТЕ: (720₽)

-Целевое действие:
  Встреча с представителем + Покупка дороже 100 ₽ новым клиентом

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/5u0sGgyG?erid=Kra23xqdM

-МТС Банк | Дебетовая карта | Скидка везде

-ВЫ ЗАРАБОТАЙТЕ: (732₽)

-Целевое действие:
  Выданная/Активированная карта + транзакция* на сумму покупки не менее 500 рублей в течение 90 дней

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/Z1Hbx04e?erid=2SDnjcUMV2g

-ВТБ - Платежный стикер

-ВЫ ЗАРАБОТАЙТЕ: (1140₽)

-Целевое действие:
  Платежный стикер – выдача + POS-транзакция на любую сумму

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "В случае оформления и выполнения целевых действий этих 5 карт ваш заработок составит (4398₽)",
        reply_markup: reply_markup
      )

    when 'Показать еще карты💳'

      keyboard = [
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
      ]

      reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
        keyboard: keyboard,
        resize_keyboard: true,
        one_time_keyboard: false
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/hpoWuk2f?erid=Kra23c3Xe

-Т-Банк — ALL Games Debit

-ВЫ ЗАРАБОТАЙТЕ: (700₽)

-Целевое действие:
  Встреча с представителем + Покупка дороже 100 ₽ новым клиентом

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/ZJaBDcw1?erid=Kra23VKkC

-Т-Банк — Black / Молодежная карта

-ВЫ ЗАРАБОТАЙТЕ: (600₽)

-Целевое действие:
  Встреча с представителем + Покупка дороже 100 ₽ новым клиентом

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/1p58Wz3y?erid=2SDnjexEfPQ

-Сбербанк - Дебетовая карта СберКарта для молодежи

-ВЫ ЗАРАБОТАЙТЕ: (185₽)

-Целевое действие:
  Выданная карта

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/jCNMBwXV?erid=2SDnjcz3wHC

-Сбербанк - Дебетовая карта СберКарта

-ВЫ ЗАРАБОТАЙТЕ: (340₽)

-Целевое действие:
  Выданная карта

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/R6reW2MH?erid=2SDnjcxTaXt

-МТС Деньги | Дебетовая карта

-ВЫ ЗАРАБОТАЙТЕ: (771₽)

-Целевое действие:
  Активированная дебетовая карта
  Транзакция по пластиковой карте (только покупка), не засчитывается внесение средств на счет / денежный перевод. От 500 рублей.
  Транзакция должна быть совершенна в течении 90 дней с момента получения карты

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "В случае оформления и выполнения целевых действий этих 5 карт ваш заработок составит (2596₽)",
        reply_markup: reply_markup
      )

    when 'Дебетовки с 18 лет👨‍🦱'

      keyboard = [
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Показать еще карты💰')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
      ]

      reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
        keyboard: keyboard,
        resize_keyboard: true,
        one_time_keyboard: false
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/O4g2tGat?erid=2SDnjecqKHA

-Совкомбанк - Дебетовая карта c кэшбэком

-ВЫ ЗАРАБОТАЙТЕ: (400₽)

-Целевое действие:
  Выдача

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/KNfNefOU?erid=2SDnjefkGWU

-Совкомбанк - Дебетовая карта с процентом на остаток

-ВЫ ЗАРАБОТАЙТЕ: (400₽)

-Целевое действие:
  Выдача

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/sjY1dvZ1?erid=Kra23sQWK

-Газпромбанк - Дебетовая карта МИР

-ВЫ ЗАРАБОТАЙТЕ: (1233₽)

-Целевое действие:
  На встрече представитель подписывает с клиентом договор,
  устанавливает мобильное приложение и помогает с активацией

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/QSvLQBbl?erid=Kra23nkSR

-ФОРА-БАНК – Дебетовая карта с повышенным кешбэком МИР «Все включено»

-ВЫ ЗАРАБОТАЙТЕ: (600₽)

-Целевое действие:
  Выданная карта+Транзакция от 300 руб. в течение 60 дней

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/lPq10ChL?erid=2SDnjduAK6q

-Ак Барс Банк - Дебетовая карта МИР

-ВЫ ЗАРАБОТАЙТЕ: (833₽)

-Целевое действие:
  Активация карты новым клиентом - транзакция* (любая покупка на сумму не менее 500 рублей) в течение 30 дней

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "В случае оформления и выполнения целевых действий этих 5 карт ваш заработок составит (3466₽)",
        reply_markup: reply_markup
      )

    when 'Показать еще карты💰'

      keyboard = [
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
      ]

      reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
        keyboard: keyboard,
        resize_keyboard: true,
        one_time_keyboard: false
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/Kpl3sfRW?erid=2SDnjer9FRj

-Ак Барс Банк - Дебетовая карта - Карта жителя Республики Татарстан

-ВЫ ЗАРАБОТАЙТЕ: (833₽)

-Целевое действие:
  Активация карты новым клиентом - транзакция* (любая покупка на сумму не менее 500 рублей) в течение 30 дней

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "В случае оформления и выполнения целевых действий этой 1 карты ваш заработок составит (833₽)",
        reply_markup: reply_markup
      )

    when 'Кредитки с 18 лет👨‍🦱'

      keyboard = [
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Показать еще карты🥰')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
      ]

      reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
        keyboard: keyboard,
        resize_keyboard: true,
        one_time_keyboard: false
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/UcgvJ9b3?erid=2SDnjdG5aQR

-СберБанк - Кредитная СберКарта

-ВЫ ЗАРАБОТАЙТЕ: (2400₽)

-Целевое действие:
  выданная карта любым клиентом. (Но если у клиента уже есть карта, то он вторую не получит. А если у клиента была карта,
  он ее закрыл, и получил потом новую по вашей ссылке, то такая конверсия засчитается)

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: " https://trk.ppdu.ru/click/clYRZvYW?erid=Kra23fR6c

-ВТБ - Кредитная карта

-ВЫ ЗАРАБОТАЙТЕ: (1710₽)

-Целевое действие:
  Кредитная карта – выдача + POS-транзакция на любую сумму

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/LDmOWmtQ?erid=2SDnjdSG9a1

-Т-Банк — Кредитная карта Платинум// Кешбэк 2 000 рублей

-ВЫ ЗАРАБОТАЙТЕ: (1500₽)

-Целевое действие:
  Активация карты и транзакция по ней после встречи с представителем

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/yyKnKy8z?erid=2SDnjd2Xg6d

-Т-Банк - Кредитная карта Платинум

-ВЫ ЗАРАБОТАЙТЕ: (2160₽)

-Целевое действие:
  Активация карты и транзакция по ней после встречи с представителем

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "https://trk.ppdu.ru/click/WnLSVOtf?erid=Kra23WNrz

-Газпромбанк - Кредитная карта до 180 дней без % UnionPay

-ВЫ ЗАРАБОТАЙТЕ: (3200₽)

-Целевое действие:
  Выдача+Активация

-СВЯЗАТЬСЯ: @godblsdme

        ",
        reply_markup: reply_markup
      )

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "В случае оформления и выполнения целевых действий этих 5 карт ваш заработок составит (10970₽)",
        reply_markup: reply_markup
      )

    when 'Показать еще карты🥰'

      keyboard = [
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
      ]

      reply_markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
        keyboard: keyboard,
        resize_keyboard: true,
        one_time_keyboard: false
      )

      bot.api.send_message(
  chat_id: message.chat.id,
  text: "https://trk.ppdu.ru/click/5IegjHs1?erid=2SDnjeTpMvR

-Уралсиб - Кредитная карта 120 дней без %

-ВЫ ЗАРАБОТАЙТЕ: (1850₽)

-Целевое действие:
Выдача

-СВЯЗАТЬСЯ: @godblsdme

  ",
  reply_markup: reply_markup
)

bot.api.send_message(
  chat_id: message.chat.id,
  text: "https://trk.ppdu.ru/click/UtL0IM1D?erid=2SDnjeEaYCG

-Свой банк - Кредитная Карта 120 дней

-ВЫ ЗАРАБОТАЙТЕ: (2800₽)

-Целевое действие:
Выдача+Транзакция

-СВЯЗАТЬСЯ: @godblsdme

  ",
  reply_markup: reply_markup
)

bot.api.send_message(
  chat_id: message.chat.id,
  text: "https://trk.ppdu.ru/click/wEKQgJio?erid=2SDnje5iw3n

-Уралсиб - Кредитная карта с кешбэком

-ВЫ ЗАРАБОТАЙТЕ: (1700₽)

-Целевое действие:
Выдача с минимальной транзакцией 500 рублей в течение 30 дней с момента выдачи

-СВЯЗАТЬСЯ: @godblsdme

  ",
  reply_markup: reply_markup
)

bot.api.send_message(
  chat_id: message.chat.id,
  text: "https://trk.ppdu.ru/click/CB0RcUun?erid=Kra245GDH

-Кредит Европа Банк (Россия) - КК CARD CREDIT PLUS

-ВЫ ЗАРАБОТАЙТЕ: (2130₽)

-Целевое действие:
Выдача+Активация

-СВЯЗАТЬСЯ: @godblsdme

  ",
  reply_markup: reply_markup
)

bot.api.send_message(
  chat_id: message.chat.id,
  text: "https://trk.ppdu.ru/click/yYTi2vUZ?erid=Kra23qXrM

-Кредит Европа Банк (Россия) - Карта рассрочка CARD CREDIT

-ВЫ ЗАРАБОТАЙТЕ: (2130₽)

-Целевое действие:
Выдача+Активация

-СВЯЗАТЬСЯ: @godblsdme

  ",
  reply_markup: reply_markup
)

bot.api.send_message(
  chat_id: message.chat.id,
  text: "https://trk.ppdu.ru/click/frlY11sO?erid=Kra23yZUw

-Кредит Европа Банк (Россия) - кредитная карта Urban

-ВЫ ЗАРАБОТАЙТЕ: (2130₽)

-Целевое действие:
Выдача+Активация

-СВЯЗАТЬСЯ: @godblsdme

  ",
  reply_markup: reply_markup
)

bot.api.send_message(
  chat_id: message.chat.id,
  text: "В случае оформления и выполнения целевых действий этих 6 карт ваш заработок составит (12740₽)",
  reply_markup: reply_markup
)

    when 'Отзывы💭'

      keyboard = [
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Оставить отзыв🔤💭')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Смотреть отзывы👀💭')],
        [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
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
    when 'Смотреть отзывы👀💭'

      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Смотреть отзывы👀💭', url: 'https://t.me/smgreferals')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [kb])

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Отзывы и доказательства выплат всегда можно посмотреть тут:",
        reply_markup: markup
      )

    when 'Оставить отзыв🔤💭'

      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Оставить отзыв🔤💭', url: 'https://t.me/godblsdme')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [kb])

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Оставить отзыв можно здесь, позже администратор его опубликует :)",
        reply_markup: markup
      )

    when 'Интсрукция по оформлению📖'
      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Инструкция по формлению на примере - (Т-Банк)', url: 'https://vc.ru/u/3933941-smgreferals/1597130-zdravstvuite-eto-podrobnaya-instrukciya-dlya-zarabotka-vam-nuzhno-budet-sdelat-neskolko-prostyh-deistviiinstrukciya-nizhe')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [kb])

      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Если в случае прочтения инструкции у вас всё равно остались вопросы, можете смело писать нам :)", # Можно использовать пустую строку или пробел
        reply_markup: markup
      )

    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Я вас не понял"
      )
    end
  rescue Telegram::Bot::Exceptions::ResponseError => e
    if e.message.include?('403')
      # Bot was blocked by the user, skip without logging too often
      puts "Bot was blocked by the user. Skipping..." if rand < 0.1  # Log 10% of the time
    else
      puts "An error occurred: #{e.message}"
    end
  end
else
  # Skip non-message updates silently
  # You can log this less frequently if necessary
  puts "Received a non-message update or a message without text" if rand < 0.1  # Log 10% of the time
end
  end
end
