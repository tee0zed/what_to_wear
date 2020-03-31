# encoding: utf-8

class Clothes
  attr_reader :name, :type, :temperature

  def initialize(name, type, temperature)
    @name = name
    @type = type
    @temperature = temperature.split.map(&:to_i)
  end

  def temp_match?(temperature)
    temperature.between?(@temperature[0], @temperature[1])
  end

  def to_s
    "#{@type}: #{name}"
  end
end
