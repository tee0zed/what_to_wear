# encoding: utf-8

require_relative 'lib/clothes_lib'
require_relative 'lib/item_of_clothing'

path = "#{__dir__}/data/"

clothes_pile = ClothesLib.create_lib(path)

puts "Какая на улице температура?"

current_temperature = STDIN.gets.to_i

matched_clothes = clothes_pile.match_clothes(current_temperature)

puts matched_clothes
