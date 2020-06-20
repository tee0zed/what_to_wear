# frozen_string_literal: true

class ClothesLib
  attr_reader :clothes_lib

  def self.create_lib(path)
    clothes_lib =
      Dir[File.join("#{path}*")].map do |file|
        params = File.readlines(file, chomp: true)
        params[2] = params[2][/[+|-]?\d+,\s?[+|-]?\d+/].split(',').map(&:to_i)
        ClothingItem.new(*params)
      end
    new(clothes_lib)
  end

  def initialize(clothes_lib)
    @clothes_lib = clothes_lib
  end

  def match_clothes(temp)
    by_type(types).map do |element_of_clothes|
      element_of_clothes.select { |element| element.temp_match?(temp) }.sample
    end.compact
  end

  private

  def types
    clothes_lib.map(&:type).uniq
  end

  def by_type(types)
    types.map { |type| clothes_lib.select { |item| item.type == type } }
  end
end
