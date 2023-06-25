class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :birth_date
      t.string :color
      t.string :gengre
      t.string :specie
      t.string :brees
      t.string :microchip_number
      t.text :particular_signs

      t.timestamps
    end
  end
end
