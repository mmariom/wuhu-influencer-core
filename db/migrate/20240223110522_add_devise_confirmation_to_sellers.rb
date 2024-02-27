class AddDeviseConfirmationToSellers < ActiveRecord::Migration[7.1]
  def change
    add_column :sellers, :confirmation_token, :string
    add_column :sellers, :confirmed_at, :datetime
    add_column :sellers, :confirmation_sent_at, :datetime
    add_column :sellers, :unconfirmed_email, :string
  end
end
