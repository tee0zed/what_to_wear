# frozen_string_literal: true

class ClothingItem
  attr_reader :name, :type, :temperature_range

  def initialize(name, type, temperature_range)
    @name = name
    @type = type
    @temperature_range = temperature_range
  end

  def temp_match?(temperature)
    temperature.between?(temperature_range[0], temperature_range[1])
  end

  def to_s
    "#{type}: #{name}"
  end
end
