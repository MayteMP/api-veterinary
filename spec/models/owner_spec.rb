# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Owner, type: :model) do
  let(:owner) { build(:owner) }

  describe 'when have correct values' do
    it 'retun a record after save' do
      expect { owner.save }.to change { Owner.count }.by(1)
    end

    %i[name last_name address phone_number1 email].each do |field|
      it "return valid if #{field} exist" do
        is_expected.to(validate_presence_of(field))
      end
    end

    %i[phone_number2].each do |field|
      it "return valid if #{field} is optional" do
        should_not(validate_presence_of(field))
      end
    end
  end

  describe 'when have incorrect values' do
    it 'retuns an error when does not have name' do
      owner.name = ''
      owner.save
      expect(owner.errors).to_not be_empty
    end

    it 'returns an error when email has not correct format' do
      owner.email = 'Undefined'
      owner.save
      expect(owner.errors).to_not be_empty
    end
  end
end
