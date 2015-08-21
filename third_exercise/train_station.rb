class RailwayStation
    attr_accessor  :trains, :name

    def initialize(name)
        @name = name
        @trains = []
    end

    def take_the_train(train)
        @trains << train
        puts "#{train} arrived at #{name} station."
    end

    def leave_the_train(train)
        @trains.delete(train)
        puts "#{train} has left the #{name} station."
    end

    def show_trains_on_station
        @trains.each do |train|
            puts "#{train.number}"
        end
    end
end


class Route
    attr_accessor  :routes

    def initialize
        @routes = []
    end

    def start_station
        @routes.last
    end

    def end_station
        @routes.first
    end

    def add_station(station)
        @routes << station
        puts "Added #{station.name}"
    end

    def del_station(station)
        @routes.delete station
        puts "Deleted #{station.name}"
    end

    def print_routes
        puts "Список станций"
        @routes.each do |station|
            puts "#{station.name}"
        end
    end

    def routes
        return @routes
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

    def go
        self.speed = 60
        puts "Поезд тронулся"
        next_station
    end

    def stop
        self.speed = 0
        puts "Поезд остановился"
    end

    def speed?
        return @speed
    end

    def add_wagon
        if speed? == 0
            @wagons_number += 1
            puts "Текущее кол-во вагонов #{@wagons_number}"
        else
            puts "Нельзя менять вагоны на ходу"
        end
    end

    def remove_wagon
        if speed? == 0
            @wagons_number -= 1
            puts "Текущее кол-во вагонов #{@wagons_number}"
        else
            puts "Нельзя менять вагоны на ходу"
        end
    end

    def add_route(routes)
        @route = routes
    end

    def next_station
        if @route.size == 0
            puts "Не задан маршрут"
        else
            @cur_index_station += 1
            @next_station = @route[@cur_index_station]
            puts "Следующая станция #{@next_station.name}"
        end
    end

    def show_station
        if @route.length == 0
            puts "Не задан маршрут"
        else
            puts "Текущая станция #{@route[@cur_index_station].name}"
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
train.add_route(route.routes)
train.go
train.show_station
train.add_wagon
train.next_station
train.stop
train.add_wagon




