class Route
    attr_accessor  :stations, :cur_index

    def initialize
        @stations = []
        @cur_index = 0
    end

    def stations
        @stations
    end

    def cur_index
        @cur_index
    end

    def add_station(station)
        validated, err_msg = validate!(station)
        if validated
            stations << station
            puts "Добавлена станция #{station.name}"
        else
            puts err_msg
        end
    end

    def del_station(station)
        validate!(station)
        stations.delete station
        puts "Удалена станция #{station.name}"
    end

    def start_station
        stations.last
    end

    def end_station
        stations.first
    end

    def next_station
        @cur_index = @cur_index + 1
        puts "Следующая станция #{stations[cur_index].name}"
    end

    def cur_station
        puts "Текущая станция #{stations[cur_index].name}"
    end

    def print_routes
        puts "Список станций"
        stations.each do |station|
            puts "#{station.name}"
        end
    end

    def valid?
        validate!
    rescue
        false
    end

    protected

    def validate!(station)
        err_msg = "Станция не может быть пустой" if station.nil?
        err_msg = "Class error!" unless station.class == RailwayStation

        if err_msg.length > 0
            return false, err_msg
        else
            return true, ''
        end
    end
end
