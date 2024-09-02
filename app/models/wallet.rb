class Wallet < ApplicationRecord
  belongs_to :walletable, polymorphic: true
  has_many :transaction_as_source, class_name: "Transaction", foreign_key: "source_wallet_id"
  has_many :transaction_as_target, class_name: "Transaction", foreign_key: "target_wallet_id"
end
