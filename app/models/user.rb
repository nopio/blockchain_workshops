class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :wallet
  delegate :registered_pictures, :owned_pictures, to: :wallet

  after_create do |user|
    key = Eth::Key.new
    Wallet.create(address: key.address.downcase, private_key: key.private_hex, user_id: user.id)
  end

  scope :by_address, -> (address) { joins(:wallet).find_by(wallets: { address: address }) }

  def private_key
    wallet.private_key
  end
end
