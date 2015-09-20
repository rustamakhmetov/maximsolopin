require_relative 'attr_accessors'

  extend AttrAccessors
  attr_accessor_with_history :a, :b

a = 3
b = 4
b_history


  strong_attr_accessor :c, "String"


  strong_attr_accessor :d, "Integer"

    c = 10

    d = 10
