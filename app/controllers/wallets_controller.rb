class WalletsController < ApplicationController
  def show
    wallet = Wallet.find(params[:id])
    authorize!(wallet)
    render json: { wallet: wallet,
    transactions_as_source: wallet.transaction_as_source,
    transactions_as_target: wallet.transaction_as_target
    }, status: :ok
  end
end
