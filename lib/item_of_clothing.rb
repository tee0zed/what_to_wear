# encoding: utf-8

class ItemOfClothing
  attr_reader :name, :type, :temperature_array

  def initialize(name, type, temperature_array)
    @name = name
    @type = type
    @temperature_array = temperature_array[/-?\d+, -?\d+/].split.map(&:to_i)
  end

  def temp_match?(temperature)
    temperature.between?(temperature_array[0], temperature_array[1])
  end

  def to_s
    "#{type}: #{name}"
  end
end
