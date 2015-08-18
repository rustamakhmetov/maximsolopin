=begin
Заполнить массив числами фибоначи до 100
=end
a = 0
b = 1
c = 0
fib_numbers = []


until a + b >= 100 do
    fib_numbers << a + b
    c = b;
    b += a;
    a = c
end

puts fib_numbers
