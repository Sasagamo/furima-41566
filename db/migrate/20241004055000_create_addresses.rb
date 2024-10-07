class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :phone_number,    null: false
      t.string :postal_code,     null: false
      t.integer :prefecture_id,  null: false
      t.string :city,            null: false
      t.string :street_number,   null: false
      t.string :building_name
      t.references :order,       null: false

      t.timestamps
    end
  end
end
