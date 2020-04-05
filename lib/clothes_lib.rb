# encoding: utf-8

class ClothesLib
  attr_reader :clothes_lib

  def self.create_lib(major_path)
    clothes_lib =
      ClothesLib.sorted_paths(major_path).map do |file|
        ItemOfClothing.new(*File.readlines(file, chomp: true))
      end
    ClothesLib.new(clothes_lib)
  end

  def initialize(clothes_lib)
    @clothes_lib = clothes_lib
  end

  def match_clothes(temp)
    by_type(types).map.with_index do |element_of_clothes, index|
      element_of_clothes.select! { |element| element.temp_match?(temp) }
      if element_of_clothes.empty? && [0, 1, 2, 3].include?(index)
        ["#{types[index]}: нет подходящей одежды!"]
      else
        element_of_clothes
      end
    end.compact
  end

  private

  def self.sorted_paths(major_path)
    directories = Dir[File.join("#{major_path}/*")].sort
    directories.map{ |path_to_directory| Dir["#{path_to_directory}/*"] }.flatten
  end

  def types
    clothes_lib.map(&:type).uniq
  end

  def by_type(types)
    types.map { |type| clothes_lib.select { |item| item.type == type } }
  end
end
