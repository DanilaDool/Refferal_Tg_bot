require 'telegram/bot'
require 'thread'

API = "7254953350:AAF_v3NCYfxwsmeoG7JegqSvvwX2iMtjgg4"

# Кэшируем клавиатуры, чтобы не пересоздавать их каждый раз
MAIN_KEYBOARD = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
  keyboard: [
    [Telegram::Bot::Types::KeyboardButton.new(text: 'Начать заработать💰')],
    [Telegram::Bot::Types::KeyboardButton.new(text: 'Связаться с нами💬')],
    [Telegram::Bot::Types::KeyboardButton.new(text: 'Отзывы💭')],
    [Telegram::Bot::Types::KeyboardButton.new(text: 'Инструкция по оформлению📖')]
  ],
  resize_keyboard: true,
  one_time_keyboard: false
)

CONTACT_KEYBOARD = Telegram::Bot::Types::InlineKeyboardMarkup.new(
  inline_keyboard: [
    [Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Связаться', url: 'https://t.me/godblsdme')]
  ]
)

Telegram::Bot::Client.run(API, timeout: 60) do |bot|
# Потоки для параллельной отправки сообщений
def send_message_in_thread(bot, chat_id, text, reply_markup=nil)
  Thread.new do
    bot.api.send_message(chat_id: chat_id, text: text, reply_markup: reply_markup)
  end
end

Telegram::Bot::Client.run(API) do |bot|
  bot.listen do |message|
    if message.is_a?(Telegram::Bot::Types::Message) && message.text
      begin
        case message.text
        when '/start', 'Назад'
          send_message_in_thread(bot, message.chat.id, "Выберите опцию:", MAIN_KEYBOARD)

        when 'Связаться с нами💬'
          send_message_in_thread(bot, message.chat.id, "В случае возникновения проблем или вопросов пишите сюда. Наша служба поддержки всегда рада вам помочь! :)", CONTACT_KEYBOARD)

        when 'Начать заработать💰'
          earn_keyboard = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Дебетовки с 14 лет👦')],
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Дебетовки с 18 лет👨‍🦱')],
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Кредитки с 18 лет👨‍🦱')],
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
            ],
            resize_keyboard: true,
            one_time_keyboard: false
          )

          send_message_in_thread(bot, message.chat.id, "Выберите подходящий вариант, чтобы мы могли определить, какие реферальные программы подходят именно для вас:", earn_keyboard)

        when 'Дебетовки с 14 лет👦'
          # Кнопки для дебетовых карт
          card_keyboard = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Показать еще карты💳')],
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
            ],
            resize_keyboard: true,
            one_time_keyboard: false
          )
          # Массив сообщений для дебетовых карт
          messages = [
            "https://trk.ppdu.ru/click/Lqv93Dty?erid=Kra23bfT9\n-ВТБ - Дебетовая карта МИР\n-ВЫ ЗАРАБОТАЙТЕ: (1140₽)\n-Целевое действие: Дебетовая карта – выдача + POS-транзакция на любую сумму\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/DfMG115b?erid=Kra246EPA\n-Альфа - Банк - Дебетовая Альфа-карта МИР\n-ВЫ ЗАРАБОТАЙТЕ: (666₽)\n-Целевое действие: Активированная карта – карта, по которой была совершена расходная операция по пластиковой карте (только покупка) в течение 90 дней после получения\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/J71BIGpi?erid=Kra23xCCG\n-Т-Банк - Дебетовая карта Black МИР\n-ВЫ ЗАРАБОТАЙТЕ: (720₽)\n-Целевое действие: Встреча с представителем + Покупка дороже 100 ₽ новым клиентом\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/5u0sGgyG?erid=Kra23xqdM\n-МТС Банк | Дебетовая карта | Скидка везде\n-ВЫ ЗАРАБОТАЙТЕ: (732₽)\n-Целевое действие: Выданная/Активированная карта + транзакция* на сумму покупки не менее 500 рублей в течение 90 дней\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/Z1Hbx04e?erid=2SDnjcUMV2g\n-ВТБ - Платежный стикер\n-ВЫ ЗАРАБОТАЙТЕ: (1140₽)\n-Целевое действие: Платежный стикер – выдача + POS-транзакция на любую сумму\n-СВЯЗАТЬСЯ: @godblsdme"
          ]
          # Отправляем сообщения в потоках
          messages.each do |msg|
            send_message_in_thread(bot, message.chat.id, msg, card_keyboard)
          end
          sleep(0.5)
          send_message_in_thread(bot, message.chat.id, "В случае оформления и выполнения целевых действий этих 5 карт ваш заработок составит (4398₽)", card_keyboard)

        when 'Показать еще карты💳'
          card_keyboard = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
            ],
            resize_keyboard: true,
            one_time_keyboard: false
          )
          messages = [
            "https://trk.ppdu.ru/click/hpoWuk2f?erid=Kra23c3Xe\n-Т-Банк — ALL Games Debit\n-ВЫ ЗАРАБОТАЙТЕ: (700₽)\n-Целевое действие: Встреча с представителем + Покупка дороже 100 ₽ новым клиентом\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/ZJaBDcw1?erid=Kra23VKkC\n-Т-Банк — Black / Молодежная карта\n-ВЫ ЗАРАБОТАЙТЕ: (600₽)\n-Целевое действие: Встреча с представителем + Покупка дороже 100 ₽ новым клиентом\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/1p58Wz3y?erid=2SDnjexEfPQ\n-Сбербанк - Дебетовая карта СберКарта для молодежи\n-ВЫ ЗАРАБОТАЙТЕ: (185₽)\n-Целевое действие: Выданная карта\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/jCNMBwXV?erid=2SDnjcz3wHC\n-Сбербанк - Дебетовая карта СберКарта\n-ВЫ ЗАРАБОТАЙТЕ: (340₽)\n-Целевое действие: Выданная карта\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/R6reW2MH?erid=2SDnjcxTaXt\n-МТС Деньги | Дебетовая карта\n-ВЫ ЗАРАБОТАЙТЕ: (771₽)\n-Целевое действие: Активированная дебетовая карта. Транзакция по пластиковой карте (только покупка), не засчитывается внесение средств на счет / денежный перевод. От 500 рублей\n-СВЯЗАТЬСЯ: @godblsdme"
          ]
          messages.each do |msg|
            send_message_in_thread(bot, message.chat.id, msg, card_keyboard)
          end
          sleep(0.5)
          send_message_in_thread(bot, message.chat.id, "В случае оформления и выполнения целевых действий этих 5 карт ваш заработок составит (2596₽)", card_keyboard)

        when 'Дебетовки с 18 лет👨‍🦱'
          earn_keyboard = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Показать еще карты💰')],
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
            ],
            resize_keyboard: true,
            one_time_keyboard: false
          )
          messages = [
            "https://trk.ppdu.ru/click/O4g2tGat?erid=2SDnjecqKHA\n-Совкомбанк - Дебетовая карта c кэшбэком\n-ВЫ ЗАРАБОТАЙТЕ: (400₽)\n-Целевое действие: Выдача\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/KNfNefOU?erid=2SDnjefkGWU\n-Совкомбанк - Дебетовая карта с процентом на остаток\n-ВЫ ЗАРАБОТАЙТЕ: (400₽)\n-Целевое действие: Выдача\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/sjY1dvZ1?erid=Kra23sQWK\n-Газпромбанк - Дебетовая карта МИР\n-ВЫ ЗАРАБОТАЙТЕ: (1233₽)\n-Целевое действие: На встрече представитель подписывает с клиентом договор, устанавливает мобильное приложение и помогает с активацией\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/QSvLQBbl?erid=Kra23nkSR\n-ФОРА-БАНК – Дебетовая карта с повышенным кешбэком МИР «Все включено»\n-ВЫ ЗАРАБОТАЙТЕ: (600₽)\n-Целевое действие: Выданная карта+Транзакция от 300 руб. в течение 60 дней\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/lPq10ChL?erid=2SDnjduAK6q\n-Ак Барс Банк - Дебетовая карта МИР\n-ВЫ ЗАРАБОТАЙТЕ: (833₽)\n-Целевое действие: Активация карты новым клиентом - транзакция* (любая покупка на сумму не менее 500 рублей) в течение 30 дней\n-СВЯЗАТЬСЯ: @godblsdme"
          ]
          messages.each do |msg|
            send_message_in_thread(bot, message.chat.id, msg, earn_keyboard)
          end
          sleep(0.5)
          send_message_in_thread(bot, message.chat.id, "В случае оформления и выполнения целевых действий этих 5 карт ваш заработок составит (3466₽)", earn_keyboard)

        when 'Показать еще карты💰'
          keyboard = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
            ],
            resize_keyboard: true,
            one_time_keyboard: false
          )
          send_message_in_thread(bot, message.chat.id, "https://trk.ppdu.ru/click/Kpl3sfRW?erid=2SDnjer9FRj\n-Ак Барс Банк - Дебетовая карта - Карта жителя Республики Татарстан\n-ВЫ ЗАРАБОТАЙТЕ: (833₽)\n-Целевое действие: Активация карты новым клиентом - транзакция* (любая покупка на сумму не менее 500 рублей) в течение 30 дней\n-СВЯЗАТЬСЯ: @godblsdme", keyboard)
          sleep(0.5)
          send_message_in_thread(bot, message.chat.id, "В случае оформления и выполнения целевых действий этой 1 карты ваш заработок составит (833₽)", keyboard)

        when 'Кредитки с 18 лет👨‍🦱'
          credit_keyboard = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Показать еще карты🥰')],
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
            ],
            resize_keyboard: true,
            one_time_keyboard: false
          )
          messages = [
            "https://trk.ppdu.ru/click/UcgvJ9b3?erid=2SDnjdG5aQR\n-СберБанк - Кредитная СберКарта\n-ВЫ ЗАРАБОТАЙТЕ: (2400₽)\n-Целевое действие: выданная карта любым клиентом. (Но если у клиента уже есть карта, то он вторую не получит. А если у клиента была карта, он ее закрыл, и получил потом новую по вашей ссылке, то такая конверсия засчитается)\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/clYRZvYW?erid=Kra23fR6c\n-ВТБ - Кредитная карта\n-ВЫ ЗАРАБОТАЙТЕ: (1710₽)\n-Целевое действие: Кредитная карта – выдача + POS-транзакция на любую сумму\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/LDmOWmtQ?erid=2SDnjdSG9a1\n-Т-Банк — Кредитная карта Платинум// Кешбэк 2 000 рублей\n-ВЫ ЗАРАБОТАЙТЕ: (1500₽)\n-Целевое действие: Активация карты и транзакция по ней после встречи с представителем\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/yyKnKy8z?erid=2SDnjd2Xg6d\n-Т-Банк - Кредитная карта Платинум\n-ВЫ ЗАРАБОТАЙТЕ: (2160₽)\n-Целевое действие: Активация карты и транзакция по ней после встречи с представителем\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/WnLSVOtf?erid=Kra23WNrz\n-Газпромбанк - Кредитная карта до 180 дней без % UnionPay\n-ВЫ ЗАРАБОТАЙТЕ: (3200₽)\n-Целевое действие: Выдача+Активация\n-СВЯЗАТЬСЯ: @godblsdme"
          ]
          messages.each do |msg|
            send_message_in_thread(bot, message.chat.id, msg, credit_keyboard)
          end
          sleep(0.5)
          send_message_in_thread(bot, message.chat.id, "В случае оформления и выполнения целевых действий этих 5 карт ваш заработок составит (10970₽)", credit_keyboard)

        when 'Показать еще карты🥰'
          keyboard = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
            ],
            resize_keyboard: true,
            one_time_keyboard: false
          )
          messages = [
            "https://trk.ppdu.ru/click/5IegjHs1?erid=2SDnjeTpMvR\n-Уралсиб - Кредитная карта 120 дней без %\n-ВЫ ЗАРАБОТАЙТЕ: (1850₽)\n-Целевое действие: Выдача\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/UtL0IM1D?erid=2SDnjeEaYCG\n-Свой банк - Кредитная Карта 120 дней\n-ВЫ ЗАРАБОТАЙТЕ: (2800₽)\n-Целевое действие: Выдача+Транзакция\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/wEKQgJio?erid=2SDnje5iw3n\n-Уралсиб - Кредитная карта с кешбэком\n-ВЫ ЗАРАБОТАЙТЕ: (1700₽)\n-Целевое действие: Выдача с минимальной транзакцией 500 рублей в течение 30 дней с момента выдачи\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/CB0RcUun?erid=Kra245GDH\n-Кредит Европа Банк (Россия) - КК CARD CREDIT PLUS\n-ВЫ ЗАРАБОТАЙТЕ: (2130₽)\n-Целевое действие: Выдача+Активация\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/yYTi2vUZ?erid=Kra23qXrM\n-Кредит Европа Банк (Россия) - Карта рассрочка CARD CREDIT\n-ВЫ ЗАРАБОТАЙТЕ: (2130₽)\n-Целевое действие: Выдача+Активация\n-СВЯЗАТЬСЯ: @godblsdme",
            "https://trk.ppdu.ru/click/frlY11sO?erid=Kra23yZUw\n-Кредит Европа Банк (Россия) - кредитная карта Urban\n-ВЫ ЗАРАБОТАЙТЕ: (2130₽)\n-Целевое действие: Выдача+Активация\n-СВЯЗАТЬСЯ: @godblsdme"
          ]
          messages.each do |msg|
            send_message_in_thread(bot, message.chat.id, msg, keyboard)
          end
          sleep(0.5)
          send_message_in_thread(bot, message.chat.id, "В случае оформления и выполнения целевых действий этих 6 карт ваш заработок составит (12740₽)", keyboard)

        when 'Отзывы💭'
          review_keyboard = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Оставить отзыв🔤💭')],
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Смотреть отзывы👀💭')],
              [Telegram::Bot::Types::KeyboardButton.new(text: 'Назад')]
            ],
            resize_keyboard: true,
            one_time_keyboard: false
          )
          send_message_in_thread(bot, message.chat.id, "Выберите опцию:", review_keyboard)

        when 'Смотреть отзывы👀💭'
          kb = [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Смотреть отзывы👀💭', url: 'https://t.me/smgreferals')
          ]
          markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [kb])
          send_message_in_thread(bot, message.chat.id, "Отзывы и доказательства выплат всегда можно посмотреть тут:", markup)

        when 'Оставить отзыв🔤💭'
          kb = [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Оставить отзыв🔤💭', url: 'https://t.me/godblsdme')
          ]
          markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [kb])
          send_message_in_thread(bot, message.chat.id, "Оставить отзыв можно здесь, позже администратор его опубликует :)", markup)

        when 'Инструкция по оформлению📖'
          kb = [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Инструкция по формлению на примере - (Т-Банк)', url: 'https://vc.ru/u/3933941-smgreferals/1597130-zdravstvuite-eto-podrobnaya-instrukciya-dlya-zarabotka-vam-nuzhno-budet-sdelat-neskolko-prostyh-deistviiinstrukciya-nizhe')
          ]
          markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [kb])

          send_message_in_thread(bot, message.chat.id, "Если в случае прочтения инструкции у вас всё равно остались вопросы, можете смело писать нам :)", markup)

        else
          send_message_in_thread(bot, message.chat.id, "Я вас не понял")
        end

      rescue Telegram::Bot::Exceptions::ResponseError => e
        if e.message.include?('403')
          puts "Bot was blocked by the user. Skipping..." if rand < 0.1
        else
          puts "An error occurred: #{e.message}"
        end
      end
    else
      puts "Received a non-message update or a message without text" if rand < 0.1
    end

    def send_message_in_thread(bot, chat_id, text, reply_markup=nil)
      Thread.new do
        attempts = 0
        begin
          bot.api.send_message(chat_id: chat_id, text: text, reply_markup: reply_markup)
        rescue Faraday::ConnectionFailed, Net::OpenTimeout => e
          attempts += 1
          if attempts < 3
            puts "Ошибка подключения. Повторная попытка #{attempts}..."
            sleep(5) # Задержка перед повторной попыткой
            retry
          else
            puts "Не удалось отправить сообщение после 3 попыток: #{e.message}"
          end
        end
      end
    end

  end
end
end
