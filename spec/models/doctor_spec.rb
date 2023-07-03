# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Doctor, type: :model) do
  let(:doctor) { build(:doctor) }

  describe 'when have correct values' do
    it 'retun a record after save' do
      expect { doctor.save }.to change { Doctor.count }.by(1)
    end

    %i[name last_name address phone1 email last_degree certificate_number].each do |field|
      it "return valid if #{field} exist" do
        is_expected.to(validate_presence_of(field))
      end
    end

    %i[phone2 birth_date].each do |field|
      it "return valid if #{field} is optional" do
        should_not(validate_presence_of(field))
      end
    end
  end

  describe 'when have incorrect values' do
    it 'retuns an error when does not have name' do
      doctor.name = ''
      doctor.save
      expect(doctor.errors).to_not be_empty
    end

    it 'returns an error when email has not correct format' do
      doctor.email = 'Undefined'
      doctor.save
      expect(doctor.errors).to_not be_empty
    end
  end
end
