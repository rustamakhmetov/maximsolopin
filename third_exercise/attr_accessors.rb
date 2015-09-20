module AttrAccessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      history = []
      define_method(name) { instance_variable_get("@#{name}".to_sym) }
      define_method("#{name}_history".to_sym) { instance_variable_get("@#{name}_history".to_sym) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set("@#{name}".to_sym, value)
        instance_variable_set("@#{name}_history".to_sym, history << value)
      end
    end
  end

  def strong_attr_accessor(name, name_class)
    define_method(name) { instance_variable_get("@#{name}".to_sym) }
    define_method("#{name}=".to_sym) do |value|
      raise "Неправильный класс у переменной" if !value.class.is_a?(name_class)
      instance_variable_set("@#{name}".to_sym, value)
    end
  end
end
