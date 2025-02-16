class CreateSells < ActiveRecord::Migration[7.0]
  def change
    create_table :sells do |t|
      t.references :order, null: false, foreign_key: true
      t.string :card_information, null: false, default: ""
      t.string :expiry, null: false, default: ""
      t.string :code, null: false, default: ""
      t.integer :region_id, null: false
      t.string :post_code, null: false, default: ""
      t.string :prefecture, null: false, default: ""
      t.string :street_address, null: false, default: ""
      t.string :building
      t.string :telephone_number, null: false, default: ""
      t.timestamps
    end
  end
end