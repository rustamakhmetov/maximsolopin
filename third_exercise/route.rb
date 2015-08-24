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
