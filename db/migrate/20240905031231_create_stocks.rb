class CreateStocks < ActiveRecord::Migration[7.2]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :company_name
      t.decimal :current_price, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
