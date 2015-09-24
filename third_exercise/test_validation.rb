# -*- encoding: utf-8 -*-

require_relative 'validations'
require_relative 'railway_station'

class TestValidation
  include Validations
  attr_accessor :name, :number, :station

  validate :name, :presence
  validate :number, :format, /A-Z{0,3}/
  validate :station, :type, RailwayStation
end

class TestValidation2
  include Validations
  attr_accessor :name, :number, :station

  validate :number, :format, /A{1,3}/
end



if __FILE__ == $PROGRAM_NAME
  t = TestValidation.new
  t.name = 'test'
  t.number = 'A-Z'
  t.station = RailwayStation.new(1, 'RT1')
  puts t.valid? ? "OK" : "BAD"

  t.name = ''
  t.number = 'A-Z'
  t.station = RailwayStation.new(2, 'RT1')
  puts !t.valid? ? "OK" : "BAD"

  t.name = 'test'
  t.number = 'A'
  t.station = RailwayStation.new(3, 'RT1')
  puts !t.valid? ? "OK" : "BAD"

  t.name = 'test'
  t.number = 'A-Z'
  t.station = Class.new
  puts !t.valid? ? "OK" : "BAD"

  t2 = TestValidation2.new
  t2.number = "A"
  puts t2.valid? ? "OK" : "BAD"
  t2.number = "B"
  puts !t2.valid? ? "OK" : "BAD"
end
