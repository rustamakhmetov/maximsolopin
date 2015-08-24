class PassangerTrain < Train
    def train_type
        "Passanger"
    end

    def add_wagon(wagon)
        if wagon.wagon_type == "Passanger"
            if !train_moving?
                @wagons << wagon
                puts "Вагон добавлен"
            else
                puts "Нельзя менять вагоны на ходу"
            end
        else
            puts "Нельзя добавить вагон!"
        end
    end

    def remove_wagon(wagon)
        if wagon.wagon_type == "Passanger"
            if !train_moving?
                @wagons.delete wagon
                puts "Вагон добавлен"
            else
                puts "Нельзя менять вагоны на ходу"
            end
        else
            puts "Нельзя добавить вагон!"
        end
    end
end
