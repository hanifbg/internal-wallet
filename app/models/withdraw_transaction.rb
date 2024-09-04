class WithdrawTransaction < Transaction
  def process
    raise "Insufficient funds" if source_wallet.balance < amount.abs

    source_wallet.decrement!(:balance, amount.abs)
  end
end
