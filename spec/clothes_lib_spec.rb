# frozen_string_literal: true

require 'clothing_item'
require 'clothes_lib'

describe 'ClothesLib' do
  let(:lib) { ClothesLib.create_lib('./spec/fixtures/') }

  describe '.create_lib' do
    let(:clothes) { lib.clothes_lib.select { |item| item.name == 'толстовка' }.first }

    it 'assign vars correctly' do
      expect(lib.clothes_lib.map(&:name)).to match_array %w[панама слипоны толстовка]
      expect(lib.clothes_lib.map(&:type)).to match_array %w[головной\ убор обувь торс]
      expect(lib.clothes_lib.map(&:temperature_range)).to eq [[10, 19], [15, 30], [15, 24]]
    end

    it 'create instance of ClothesLib class' do
      expect(lib).to be_a_kind_of ClothesLib
    end

    it 'create all objects from dir' do
      expect(lib.clothes_lib.count).to eq 3
    end
  end

  describe '#match_clothes' do
    context 'when transferred matched temp' do
      let(:temp) { 20 }
      let(:result) { lib.match_clothes(temp) }

      it 'return matched obj' do
        expect(result.map(&:name)).to match_array %w[панама слипоны]
      end
    end

    context 'when transferred not matched temp' do
      let(:temp) { -10 }
      let(:result) { lib.match_clothes(temp) }

      it 'return empty array' do
        expect(result).to be_empty
      end
    end
  end
end
