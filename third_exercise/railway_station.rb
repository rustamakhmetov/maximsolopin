class RailwayStation
    attr_accessor  :trains, :name, :number

    def initialize(number, name)
        @number = number
        @name = name
        @trains = []
    end

    def take_the_train(train)
        if trains.include? train
            puts "Поезд уже на этой станции"
        else
            trains << train
            puts "Поезд номер #{train.number} прибыл на станцию #{name}."
        end
    end

    def leave_the_train(train)
        trains.delete(train)
        puts "Поезд номер #{train.number} отправился со станции #{name}."
    end

    def show_trains_on_station
        if trains.size > 0
            puts "  Поезда на станции:"
            trains.each do |train|
                puts "      Поезд №#{train.number}"
            end
        else
            puts "  Поездов на станции нет"
        end
    end

    private

    def trains
        @trains
    end

end
