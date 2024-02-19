class CreateSellerCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :seller_companies, id: :uuid do |t|

      t.string :company_name
      t.string :street
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :company_reg_number
      t.references :seller, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
