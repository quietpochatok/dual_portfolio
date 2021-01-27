require_relative "lib/parser_site.rb"
require 'open-uri'

# проверка интернет соединени
def internet_connection?
  begin
    true if URI.open("http://www.google.com/")
  rescue
    false
  end
end

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

rate_value =

  if internet_connection?
    ParserSite.parsing_rate_value_from_cbr
  else
    puts "Интернет-соединение отсуствуют, введите курса рубля к доллару:"
    gets.to_f
  end

puts "Kурс доллара составляет #{rate_value} рублей за 1 доллар"

sum_usd = (amount_usd * rate_value)

compare = compare_values(sum_usd, amount_rub, rate_value)

calculation_output = calculation_balance(compare)

puts calculation_output
