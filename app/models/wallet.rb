class Wallet < ApplicationRecord
  belongs_to :user
  has_many :registered_pictures, class_name: 'Picture'
  has_and_belongs_to_many :owned_pictures, class_name: 'Picture', join_table: 'ownerships'

  delegate :email, to: :user
end