class CreateShippingAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_adresses do |t|
      t.references :order,          foreign_key: true
      t.string :postcode, null: false
      t.integer :prefecture_id , null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
