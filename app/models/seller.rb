class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    

  has_one :seller_company
  has_one :seller_address

  accepts_nested_attributes_for :seller_address
  accepts_nested_attributes_for :seller_company

end
