require_relative 'manufacturer'

class Train
    include Manufacturer

    attr_accessor :speed, :number

    @@trains = Hash.new

    def initialize(number)
        @number = number
        @speed = 0
        @cur_index_station = 0
        @wagons = Hash.new
        @@trains[number] = self
    end

    def next_station
        @next_station
    end

    def speed
        @speed
    end

    def speed=(speed)
        @speed = speed
    end

    def go
        speed = 60
        puts "Поезд тронулся"
        next_station
    end

    def stop
        speed = 0
        puts "Поезд остановился"
    end

    def train_moving?
        speed > 0
    end

    def route=(route)
        @route = route
    end

    def next_station
        if route.size == 0
            puts "Не задан маршрут"
        else
            increase_index_station
            next_station = route[cur_index_station]
            puts "Следующая станция #{next_station.name}"
        end
    end

    def show_station
        if route.length == 0
            puts "Не задан маршрут"
        else
            puts "Текущая станция #{route[cur_index_station].name}"
        end
    end

    def wagons
        @wagons
    end

    def add_wagon(wagon)
        if wagon.wagon_type == train_type
            if !train_moving?
                @wagons[wagon.number] = wagon
                puts "Вагон добавлен"
            else
                puts "Нельзя менять вагоны на ходу"
            end
        else
            puts "Нельзя добавить вагон!"
        end
    end

    def remove_wagon(wagon)
        if wagon.wagon_type == train_type
            if !train_moving?
                @wagons.delete(wagon.number)
                puts "Вагон удален"
            else
                puts "Нельзя менять вагоны на ходу"
            end
        else
            puts "Нельзя удалить вагон!"
        end
    end

    def self.find(number)
        puts "Find"
        @@trains[number]
    end

    private

    def route
        @route
    end

    def cur_index_station
        @cur_index_station
    end

    def increase_index_station
        @cur_index_station = @cur_index_station + 1
    end
end



