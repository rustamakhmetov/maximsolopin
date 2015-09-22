module Validations
    def self.included(base)
        base.extend ClassMethods
        base.send :include, InstanceMethods
    end

    module ClassMethods
        def validate(validation_type, value, validation_format = "")
            puts value
            @validates ||= {}
            @validates[validation_type] = value
            @format = validation_format
        end
    end

    module InstanceMethods
        def validate!
            self.class.instance_variable_get("@validates").each do |type, value|
                send type, value
            end
            true
        end

        def valid?
            validate!
        rescue
            false
        end

        private

        def presence(val)
            raise "Значение атрибута не должно быть nil или пустой строкой" if val.nil? || val == ""
        end

        def format(var)
          raise "Неверный формат" if var !~ @format
        end

        def type(var)
          raise "Неверный класс" unless var.class == @format
        end
    end
end
