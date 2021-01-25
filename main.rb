require_relative "lib/parser_site.rb"

# Бивалютный портфель
def compare_values(sum_usd, amount_rub, rate_value)
  result = (sum_usd - amount_rub) / 2 / rate_value
  result.abs < 0.01 ? 0 : result
end

def calculation_balance(value)
  value = value.round(2)
  if value.zero?
    "Все хорошо портфель сбалансирован"
  elsif value.positive?
    "Вам следует продать #{value} $"
  else
    "Вам следует купить #{value.abs} $"
  end
end

puts "Сколько у вас долларов?"
amount_usd = gets.to_f

puts "Сколько у вас рублей?"
amount_rub = gets.to_f

puts "Выберите источник курса рубля в доллару:
        1. Из сайта ЦентроБанка
        2. Ручной ввод с клавиатуры"

user_choice = gets.to_i

rate_value =

  user_choice == 1 ? ParserSite.parsing_rate_value_from_cbr : gets.to_f

puts "Kурс доллара составляет #{rate_value} рублей за 1 доллар"

sum_usd = (amount_usd * rate_value)

compare = compare_values(sum_usd, amount_rub, rate_value)

calculation_output = calculation_balance(compare)

puts calculation_output
