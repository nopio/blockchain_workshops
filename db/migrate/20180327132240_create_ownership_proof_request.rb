class CreateOwnershipProofRequest < ActiveRecord::Migration[5.1]
  def change
    create_table :ownership_proofs do |t|
      t.integer :picture_id, foreign_key: true
      t.string :receiver_email
      t.string :signed_token
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
