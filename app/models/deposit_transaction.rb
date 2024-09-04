class DepositTransaction < Transaction
  def process
    target_wallet.increment!(:balance, amount)
  end
end
