# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :last_name
      t.date :birth_date
      t.string :phone1
      t.string :phone2
      t.string :address
      t.string :last_degree
      t.string :certificate_number
      t.string :email

      t.timestamps
    end
  end
end
