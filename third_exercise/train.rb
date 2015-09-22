require_relative 'manufacturer'
require_relative 'validations'

class Train
    include Manufacturer
    include Validations

    NUMBER_FORMAT = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i

    attr_accessor :speed, :number, :wagons

    validate :presence, :number
    validate :format, :number, NUMBER_FORMAT

    @@trains = Hash.new

    def self.find(number)
        @@trains[number]
    end

    def initialize(number)
        @number = number
        @speed = 0
        @cur_index_station = 0
        @wagons = Hash.new

        validate!
        @@trains[number] = self
    end

    def do_something(&block)
        wagons.each do |number, wagon|
            block.call(wagon)
        end
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
            raise "Не задан маршрут"
        else
            next_station = route[cur_index_station]
            puts "Следующая станция #{next_station.name}"
            increase_index_station
        end
    end

    def show_station
        if route.length == 0
            raise "Не задан маршрут"
        else
            puts "Текущая станция #{route[cur_index_station].name}"
        end
    end

    def add_wagon(wagon)
        if wagon.wagon_type == train_type
            if !train_moving?
                @wagons[wagon.number] = wagon
            else
                raise "Нельзя менять вагоны на ходу"
            end
        else
            raise "Нельзя добавить вагон с типом #{wagon.wagon_type} в #{train_type} поезд"
        end
    end

    def remove_wagon(wagon)
        if wagon.wagon_type == train_type
            if !train_moving?
                @wagons.delete(wagon.number)
            else
                raise "Нельзя менять вагоны на ходу"
            end
        else
            raise "Нельзя добавить вагон с типом #{wagon.wagon_type} в #{train_type} поезд"
        end
    end

    # def valid?
    #     validate!
    # rescue
    #     false
    # end

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

    # def validate!
    #     raise "Номер не может быть пустым" if number.nil?
    #     raise "Номер не может быть меньше 3 символов" if number.length < 3
    #     raise "Неверный формат номер поезда" if number !~ NUMBER_FORMAT
    #     raise "Неуникальный номер поезда!" if !Train.find(number).nil?
    #     true
    # end

end


