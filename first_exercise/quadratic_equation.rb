=begin
Пользователь вводит 3 коэффициента a, b и с.
Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть)
и выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
Если D > 0, то выводим дискриминант и 2 корня
Если D = 0, то выводим дискриминант и 1 корень (т.к. они в этом случае равны)
Если D < 0, то выводим дискриминант и сообщение "Корней нет"
=end

puts "Решение квадратного уравнения"

print "Введите a = "
a = gets.chomp.to_f

print "Введите b = "
b = gets.chomp.to_f

print "Введите c = "
c = gets.chomp.to_f

discriminant = b ** 2 - 4 * a * c

puts "Дискриминант = #{discriminant}"
if discriminant > 0
    x_first  = ((-1) * b + Math.sqrt(discriminant)) / (2 * a)
    x_second = ((-1) * b - Math.sqrt(discriminant)) / (2 * a)
    puts "x1 = #{x_first} x2 = #{x_second}"
elsif discriminant == 0
    x  = ((-1) * b) / (2 * a)
    puts "x1, x2 = #{x}"
else
    puts "Корней нет!"
end
