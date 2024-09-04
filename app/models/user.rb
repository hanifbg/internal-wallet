class User < ApplicationRecord
  has_secure_password
  has_one :wallet, as: :walletable
  validates :email, presence: true, uniqueness: true
end
