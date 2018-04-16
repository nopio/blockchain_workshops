class Picture < ApplicationRecord
  def self.accepted_image_types
    %w(image/jpeg image/jpg image/png image/gif)
  end

  belongs_to :author, class_name: 'Wallet', foreign_key: :wallet_id
  has_and_belongs_to_many :owners, class_name: 'Wallet', join_table: 'ownerships'
  has_many :ownership_proofs

  has_attached_file :attachment, styles: { mini: '48x48>', normal: '240x240>', email: '120x120>' }, default_url: '/images/:style/missing.png'

  validates_attachment :attachment, content_type: { content_type: accepted_image_types }
  validates :fingerprint, uniqueness: true

  scope :by_author_user_id, -> (user_id) { joins(author: :user).where(wallets: { user_id: user_id}) }
end
