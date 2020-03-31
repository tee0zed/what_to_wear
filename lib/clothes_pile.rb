# encoding: utf-8

class ClothesPile
  attr_reader :clothes_pile

  def self.from_dir(path)
    file_paths = Dir[File.join(path + '*')]
    abort "Ошибка чтения файлов /data" if file_paths.empty?

    clothes_pile = []

    file_paths.each do |path|
      params_array = File.open(path, 'r:UTF-8'){ |file| file.readlines(chomp: true) }
      clothes_pile << Clothes.new(*params_array)
    end
    ClothesPile.new(clothes_pile)
  end

  def initialize(clothes_pile)
    @clothes_pile = clothes_pile
  end

  def types
    @clothes_pile.map do |item|
      item.type
    end.uniq
  end

  def by_type(types)
    types.map do |type|
      @clothes_pile.select { |item| item.type == type }
    end
  end
end
