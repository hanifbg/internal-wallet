class Transaction < ApplicationRecord
  belongs_to :source_wallet, class_name: "Wallet", optional: true
  belongs_to :target_wallet, class_name: "Wallet", optional: true

  validates :amount, presence: true
  validates :transaction_type, presence: true
  validate :validate_wallets

  private

  def validate_wallets
    if transaction_type == "credit" && source_wallet.present?
      errors.add(:source_wallet, "must be nil for credit transaction")
    elsif transaction_type == "debit" && source_wallet.present?
      errors.add(:source_wallet, "must be nil for debit transaction")
    elsif transaction_type == "debit" && source_wallet.balance < amount
      errors.add(:source_wallet, "insufficient funds")
    end
  end
end
