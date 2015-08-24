class RailwayStation
    attr_accessor  :trains, :name

    def initialize(name)
        @name = name
        @trains = []
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

    private

    def trains
        @trains
    end

end
