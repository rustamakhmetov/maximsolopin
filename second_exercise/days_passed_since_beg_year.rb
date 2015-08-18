=begin
Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным
=end
print "Введите день: "
d = gets.chomp.to_i

print "Введите месяц: "
m = gets.chomp.to_i

print "Введите год: "
y = gets.chomp.to_i

array = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

array[1] = 29 if (y % 4 == 0 && y % 100 != 0) || (y % 400 == 0)

days_from_beg_year = 0

array.each do |month|
    day = 1

    until day > d do          # выполнять до тех пор пока n не станет больше 3
      day += 1
      days_from_beg_year += 1
    end

    break if month == m
end

puts days_from_beg_year
