class Interface

    def initialize
        @stations = Hash.new
        @trains = Hash.new
    end

    def start
        loop do
            puts "1 Создать станцию\n2 Создать поезд\n3 Добавить вагон к поезду\n4 Отцепить вагон от поезда\n5 Поместить поезд на станцию\n6 Просмотреть список станций и список поездов на станции\n7 Выход"
            var = gets.chomp.to_i

            break if var == 7

            case var
                when 1
                    create_station
                when 2
                    create_train
                when 3
                    add_wagon
                when 4
                    remowe_wagon
                when 5
                    mowe_train
                when 6
                    show_stations
                else
                    puts "Неправильный вариант... Выберите еще раз"
            end
        end
    end

    private

    def create_station
        print "Введите название станции: "
        station_number = rand(100)
        @stations[station_number] = RailwayStation.new(station_number, gets.chomp)
    end

    def create_train
        puts "Какой тип поезда? 1 - Грузовой 2 - Пассажирский"

        train_var = gets.chomp.to_i

        begin
            if train_var == 1

                puts "Какой номер поезда?"
                train_number = gets.chomp

                @trains[train_number] = CargoTrain.new(train_number)
            elsif train_var == 2
                puts "Какой номер поезда?"
                train_number = gets.chomp

                @trains[train_number] = PassangerTrain.new(train_number)
            else
                puts "Нет такого типа поезда!"
            end
        rescue StandardError => e
            puts "#{e.message}"
        end
    end

    def add_wagon
        puts "В какой номер поезда добавить вагон?"
        @trains.each  do |number, train|
            puts "#{train.number} - #{train.train_type}"
        end

        train_number = gets.chomp.to_i
        train = @trains[train_number]

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
    end

    def remowe_wagon
        puts "В каком поезде удалить вагон? (номер)"
        @trains.each  do |number, train|
            puts "#{train.number} - #{train.train_type}"
        end

        train_number = gets.chomp.to_i
        train = @trains[train_number]

        if train
            puts "Какой вагон? (номер) "
            train.wagons.each do |number, wagon|
                puts "Номер вагона #{number}"
            end

            wagon_number = gets.chomp.to_i
            wagon = train.wagons[wagon_number]
            train.remove_wagon(wagon) if wagon
        end
    end

    def mowe_train
        puts "Какой номер поезда переместить?"
        @trains.each  do |number, train|
            puts "#{train.number} - #{train.train_type}"
        end

        train_number = gets.chomp.to_i
        train = @trains[train_number]

        if train
            puts "На какую станцию? (номер)"
            @stations.each do |number, station|
                puts "#{station.number} - #{station.name}"
            end

            station_number = gets.chomp.to_i
            station = @stations[station_number]
            station.take_the_train(train) if station;
        end
    end

    def show_stations
        puts "Список станций:"
        @stations.each do |number, station|
            puts "Станция #{station.name} №#{station.number}"
            station.show_trains_on_station
        end
    end
end
