class OwnershipProof < ApplicationRecord
  belongs_to :picture
  has_secure_token

  enum status: %I[requested proven cheated]
end