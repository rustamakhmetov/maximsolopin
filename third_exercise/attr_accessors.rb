module AttrAccessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      history = []
      define_method(name) { instance_variable_get("@#{name}".to_sym) }
      define_method("#{name}_history".to_sym) { instance_variable_get("@#{name}_history".to_sym) }
      define_method("#{name}=".to_sym) do |value|
        puts '12'
        instance_variable_set("@#{name}".to_sym, value)
        history << value
        instance_variable_set("@#{name}_history".to_sym, history)
      end
    end
  end

  def strong_attr_accessor(name, name_class)
    puts name
    define_method(name) { instance_variable_get("@#{name}".to_sym) }
    puts '123'
    define_method("#{name}=".to_sym) do |value|
      puts name_class
      puts value.class
      raise "Неправильный класс у переменной" if value.class == name_class
      instance_variable_set("@#{name}".to_sym, value)
    end
  end
end
