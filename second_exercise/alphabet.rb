=begin
Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
=end
alphabet = ("а".."я").to_a
vowels = ["а", "е", "ё", "и", "о", "у", "ы", "э", "ю", "я"]
array = {}
alphabet.each_with_index do |v, id|
    array[v] = id + 1 if vowels.include?(v)
end
puts array
