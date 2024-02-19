class CreateSellerAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :seller_addresses, id: :uuid do |t|
      t.string :street
      t.string :city
      t.string :postal_code
      t.string :country
      t.references :seller, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
