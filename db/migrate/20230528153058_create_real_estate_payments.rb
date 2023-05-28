class CreateRealEstatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :real_estate_payments do |t|
      t.decimal :amount
      t.date :date
      t.references :deal, null: false, foreign_key: { to_table: :real_estate_deals}

      t.timestamps
    end
  end
end
