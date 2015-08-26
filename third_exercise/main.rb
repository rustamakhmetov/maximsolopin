require_relative 'railway_station'
require_relative 'route'
require_relative 'train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passanger_wagon'
require_relative 'passanger_train'
require_relative 'cargo_train'

# moskow = RailwayStation.new(1, "Moskow")
# piter = RailwayStation.new(2, "Piter")
# rnd = RailwayStation.new(3, "Rostov")

# route = Route.new
# route.add_station(rnd)
# route.add_station(moskow)
# route.add_station(piter)
# route.print_routes

# route.cur_station
# route.next_station
# route.next_station
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

stations = Hash.new
trains = Hash.new
loop do
puts "
1 Создать станцию
2 Создать поезд
3 Добавить вагон к поезду
4 Отцепить вагон от поезда
5 Поместить поезд на станцию
6 Просмотреть список станций и список поездов на станции
7 Выход
"
    var = gets.chomp.to_i

    break if var == 7

    case var
        when 1
            print "Введите название станции: "
            station_number = rand(100)
            stations[station_number] = RailwayStation.new(station_number, gets.chomp)
        when 2
            puts "Какой тип поезда? 1 - Грузовой 2 - Пассажирский"

            train_var = gets.chomp.to_i

            if train_var == 1
                train_number = rand(100)
                trains[train_number] = CargoTrain.new(train_number)
            elsif train_var == 2
                train_number = rand(100)
                trains[train_number] = PassangerTrain.new(train_number)
            else
                puts "Нет такого типа поезда!"
            end
        when 3
            puts "В какой номер поезда добавить вагон?"
            trains.each  do |number, train|
                puts "#{train.number} - #{train.train_type}"
            end

            train_number = gets.chomp.to_i
            train = trains[train_number]

            if train
                puts "Какой тип вагона? 1 - Грузовой 2 - Пассажирский"
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
            puts "В каком поезде удалить вагон? (номер)"
            trains.each  do |number, train|
                puts "#{train.number} - #{train.train_type}"
            end

            train_number = gets.chomp.to_i
            train = trains[train_number]

            if train
                puts "Какой вагон? (номер) "
                train.wagons.each do |number, wagon|
                    puts "Номер вагона #{number}"
                end

                wagon_number = gets.chomp.to_i
                wagon = train.wagons[wagon_number]
                train.remove_wagon(wagon) if wagon
            end
        when 5
            puts "Какой номер поезда переместить?"
            trains.each  do |number, train|
                puts "#{train.number} - #{train.train_type}"
            end

            train_number = gets.chomp.to_i
            train = trains[train_number]

            if train
                puts "На какую станцию? (номер)"
                stations.each do |number, station|
                    puts "#{station.number} - #{station.name}"
                end

                station_number = gets.chomp.to_i
                station = stations[station_number]
                station.take_the_train(train) if station;
            end
        when 6
            puts "Список станций:"
                stations.each do |number, station|
                    puts "Станция #{station.name} №#{station.number}"
                    station.show_trains_on_station
                end
        else
            puts "What is it #{var}?"
    end
end
