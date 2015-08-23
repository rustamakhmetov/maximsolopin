class RailwayStation
    attr_accessor  :trains, :name

    def initialize(name)
        @name = name
        @trains = []
    end

    def trains
        @trains
    end

    def take_the_train(train)
        trains << train
        puts "#{train} arrived at #{name} station."
    end

    def leave_the_train(train)
        trains.delete(train)
        puts "#{train} has left the #{name} station."
    end

    def show_trains_on_station
        trains.each do |train|
            puts "#{train.number}"
        end
    end
end

class Route
    attr_accessor  :stations

    def initialize
        @stations = []
    end

    def stations
        @stations
    end

    def add_station(station)
        stations << station
        puts "Added #{station.name}"
    end

    def del_station(station)
        stations.delete station
        puts "Deleted #{station.name}"
    end

    def start_station
        stations.last
    end

    def end_station
        stations.first
    end

    def print_routes
        puts "Список станций"
        stations.each do |station|
            puts "#{station.name}"
        end
    end
end

class Train
    attr_accessor :wagons_number, :speed, :number
    attr_reader :type

    def initialize(number, type, wagons_number)
        @number = number
        @type = type
        @wagons_number = wagons_number
        @speed = 0
        @cur_index_station = 0
    end

    def cur_index_station
        @cur_index_station
    end

    def increase_index_station
        @cur_index_station = @cur_index_station + 1
    end

    def next_station
        @next_station
    end

    def wagons_number
        @wagons_number
    end

    def increase_wagons_number
        @wagons_number = @wagons_number + 1
    end

    def decrease_wagons_number
        @wagons_number = @wagons_number - 1
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

    def add_wagon
        if !train_moving?
            increase_wagons_number
            puts "Текущее кол-во вагонов #{@wagons_number}"
        else
            puts "Нельзя менять вагоны на ходу"
        end
    end

    def remove_wagon
        if !train_moving?
            decrease_wagons_number
            puts "Текущее кол-во вагонов #{@wagons_number}"
        else
            puts "Нельзя менять вагоны на ходу"
        end
    end

    def route=(route)
        @route = route
    end

    def route
        @route
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
end


moskow = RailwayStation.new("Moskow")
piter = RailwayStation.new("Piter")
rnd = RailwayStation.new("Rostov")

route = Route.new
route.add_station(rnd)
route.add_station(moskow)
route.add_station(piter)
route.print_routes

train = Train.new(315, 'passenger', 25)
train.route = route.stations
train.go
train.show_station
train.add_wagon
train.next_station
train.stop
train.add_wagon




