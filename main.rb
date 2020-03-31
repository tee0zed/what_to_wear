# encoding: utf-8

require_relative 'lib/clothes_pile'
require_relative 'lib/clothes'

path = __dir__ + '/data/'

clothes_pile = ClothesPile.from_dir(path)

puts "Какая на улице температура?"

current_temperature = STDIN.gets.to_i

abort "Сидите-ка дома" if current_temperature > 30 || current_temperature < -25

types = clothes_pile.types

array_of_clothes = clothes_pile.by_type(types)

matched_clothes =
array_of_clothes.map do |element_of_clothes|
  element_of_clothes.select {|element| element.temp_match?(current_temperature)}
end

puts matched_clothes
