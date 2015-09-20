module Validation
    def validate(validation_type, value, validation_format = "")
        @validates ||= {}
        @validates[validation_type] = value
        @format = validation_format
    end

    def validate!
        instance_variable_get("@validates").each do |type, value|
            case type
            when 'presence'
                presence(value)
            when 'format'
                format(value)
            when 'type'
                type(value)
            end
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
