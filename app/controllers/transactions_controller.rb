class TransactionsController < ApplicationController
  def create
    source_wallet = Wallet.find_by(id: transaction_params[:source_wallet_id])
    target_wallet = Wallet.find_by(id: transaction_params[:source_wallet_id])

    if source_wallet
      authorize!(source_wallet)
    end

    if target_wallet
      authorize!(target_wallet)
    end

    transaction = Transaction.new(transaction_params)

    if transaction.save
      transaction.process if transaction.respond_to?(:process)

      render json: transaction, status: :created
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_type, :source_wallet_id, :target_wallet_id)
  end
end
