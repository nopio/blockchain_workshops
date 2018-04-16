class AddWalletAssociations < ActiveRecord::Migration[5.1]
  def change
    add_reference :wallets, :user, foreign_key: true
    add_column :wallets, :private_key_id, :integer, foreign_key: true, index: true
  end
end
