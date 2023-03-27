require 'rails_helper'

RSpec.describe Pet, type: :model do
  let(:pet) { build(:pet) }

  describe 'when have correct values' do
    it 'retun a record after save' do
      expect { pet.save }.to change{ Pet.count }.by(1)
    end

    %i[name birth_date color gengre specie brees].each do |field|
      it "return valid if #{field.to_s} exist" do
        is_expected.to(validate_presence_of(field))
      end
    end

    %i[microcip_number particular_signs].each do |field|
      it "return valid if #{field} is optional" do
        should_not(validate_presence_of(field))
      end
    end

  end

  describe 'when have incorrect values' do
    it 'retuns an error when does not have name' do
      pet.name = ''
      pet.save
      expect(pet.errors).to_not be_empty
    end

    it 'returns an error when the gengre is not Female or Male' do
      pet.gengre = 'Undefined'
      pet.save
      expect(pet.errors).to_not be_empty
    end

    it 'returns an error when the birth day is not a date' do
      pet.birth_date = 'has not date'
      pet.save
      expect(pet.errors).to_not be_empty
    end
  end
end
