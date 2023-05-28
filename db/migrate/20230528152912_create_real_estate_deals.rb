class CreateRealEstateDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :real_estate_deals do |t|
      t.string :name

      t.timestamps
    end
  end
end
