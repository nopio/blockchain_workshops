class AddTokenToOwnershipProof < ActiveRecord::Migration[5.1]
  def change
    add_column :ownership_proofs, :token, :string
  end
end
