class RealEstate::Payment < ApplicationRecord
  belongs_to :deal, class_name: "RealEstate::Deal"
end
