class CargoTrain < Train
    def train_type
        "Cargo"
    end

    def add_wagon(wagon)
        if wagon.wagon_type == "Cargo"
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
        if wagon.wagon_type == "Cargo"
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
end
