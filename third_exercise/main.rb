require_relative 'railway_station'
require_relative 'route'
require_relative 'train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passanger_wagon'
require_relative 'passanger_train'
require_relative 'cargo_train'

# moskow = RailwayStation.new("Moskow")
# piter = RailwayStation.new("Piter")
# rnd = RailwayStation.new("Rostov")

# route = Route.new
# route.add_station(rnd)
# route.add_station(moskow)
# route.add_station(piter)
# route.print_routes

# train = PassangerTrain.new(315)
# train.route = route.stations
# train.go

# wagon = CargoWagon.new(1)
# passanger_wagon = PassangerWagon.new(2)

# train.show_station
# train.add_wagon(wagon)
# train.next_station
# train.stop
# train.add_wagon(passanger_wagon)

stations = []
trains = []
loop do
    puts "\nВыберите вариант\n
    1 Создавать станции
    2 Создавать поезда
    3 Добавлять вагоны к поезду
    4 Отцеплять вагоны от поезда
    5 Помещать поезда на станцию
    6 Просматривать список станций и список поездов на станции
    7 Выход
    "

    var = gets.chomp.to_i

    break if var == 7

    case var
        when 1
            puts "Введите название станции"
            stations << RailwayStation.new(gets.chomp)
            puts stations
        when 2
            puts "Какой тип поезда? 1 - Грузовой 2 - Пассажирский"

            train_var = gets.chomp.to_i

            if train_var == 1
                trains << CargoTrain.new(rand(100))
            elsif train_var == 2
                trains << PassangerTrain.new(rand(100))
            else
                puts "Нет такого типа поезда!"
            end
            puts trains
        when 3
            puts "В какой поезд добавить вагон? (индекс)"
            trains.each_with_index  do |train, index|
                puts "index: #{index}          #{train.number} - #{train.train_type}"
            end

            train_number = gets.chomp.to_i
            train = trains[train_number]

            if train
                puts "Какой тип вагона? 1 - Грузовой 2 - Пассажирский "
                wagon_var = gets.chomp.to_i

                if wagon_var == 1 && train
                    train.add_wagon(CargoWagon.new(1))
                elsif wagon_var == 2 && train
                    train.add_wagon(PassangerWagon.new(1))
                else
                    puts "Ахтунг!"
                end
            end
        when 4
            puts "В каком поезде удалить вагон? (индекс)"
            trains.each_with_index  do |train, index|
                puts "index: #{index}          #{train.number} - #{train.train_type}"
            end

            train_number = gets.chomp.to_i
            train = trains[train_number]

            if train
                puts "Какой вагон? (индекс) "
                train.wagons.each_with_index  do |wagon, index|
                    puts "index: #{index}         Номер вагонна #{wagon.number}"
                end

                wagon_number = gets.chomp.to_i
                wagon = train.wagons[wagon_number]

                train.remove_wagon(wagon) if wagon

            end
        when 5
            puts "Not working now"
        when 6
            puts "Not working now"
        else
            puts "What is it #{var}?"
    end


end
