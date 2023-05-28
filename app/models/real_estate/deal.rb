class RealEstate::Deal < ApplicationRecord
  has_many :payments, class_name: "RealEstate::Payment", dependent: :destroy
end
