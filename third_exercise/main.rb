require_relative 'railway_station'
require_relative 'route'
require_relative 'train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passanger_wagon'
require_relative 'passanger_train'
require_relative 'cargo_train'
require_relative 'interface'
require_relative 'manufacturer'


# moskow = RailwayStation.new(1, "Moskow")
# piter = RailwayStation.new(2, "Piter")
# rnd = RailwayStation.new(3, "Rostov")

 route = Route.new
 route.add_station(nil)
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


# puts Train.find(315)
# puts RailwayStation.all

Interface.new.start


