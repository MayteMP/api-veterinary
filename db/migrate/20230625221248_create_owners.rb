# frozen_string_literal: true

class CreateOwners < ActiveRecord::Migration[7.0]
  def change
    create_table(:owners) do |t|
      t.string :name
      t.string :last_name
      t.date :birth_day
      t.string :address
      t.string :phone_number1
      t.string :phone_number2
      t.string :email

      t.timestamps
    end
  end
end
