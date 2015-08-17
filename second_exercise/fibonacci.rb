=begin
Заполнить массив числами фибоначи до 100
=end
a = 0
b = 1
c = 0
fib_numbers = []

begin
    fib_numbers.push a + b
    c = b;
    b += a;
    a = c
end until a + b >= 100

puts fib_numbers
