# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pet, type: :model do
  let(:owner) { create(:owner) }

  let(:pet) { build(:pet, owner: owner) }

  describe 'associations' do
    it { should belong_to(:owner).class_name('Owner') }
  end

  describe 'when have correct values' do
    it 'retun a record after save' do
      expect { pet.save }.to change { Pet.count }.by(1)
    end

    %i[name color gengre specie brees].each do |field|
      it "return valid if #{field} exist" do
        is_expected.to(validate_presence_of(field))
      end
    end

    %i[microchip_number particular_signs].each do |field|
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
  end
end
