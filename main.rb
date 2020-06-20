# frozen_string_literal: true

require_relative 'lib/clothes_lib'
require_relative 'lib/clothing_item'

path = "#{__dir__}/data/"

clothes_pile = ClothesLib.create_lib(path)

puts 'Какая на улице температура?'

current_temperature = STDIN.gets.to_i

matched_clothes = clothes_pile.match_clothes(current_temperature)

if matched_clothes.empty?
  puts 'Нет подходящей одежды под эту температуру!'
else
  puts 'Вот подходящая одежда под эту температуру:'
  puts matched_clothes
end
