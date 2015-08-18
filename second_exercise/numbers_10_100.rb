=begin
Заполнить массив числами от 10 до 100 с шагом 5
=end

number = []

(10..100).step(5) do |n|
    number << n
end

puts number
