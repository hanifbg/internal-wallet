class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.references :source_wallet, foreign_key: { to_table: :wallets }, null: false, index: true
      t.references :target_wallet, foreign_key: { to_table: :wallets }, null: false, index: true
      t.string :transaction_type

      t.timestamps
    end
  end
end
