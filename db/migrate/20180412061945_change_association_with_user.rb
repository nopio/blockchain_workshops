class ChangeAssociationWithUser < ActiveRecord::Migration[5.1]
  def up
    remove_column :ownerships, :user_id

    add_column :ownerships, :wallet_id, :integer, index: true
    add_foreign_key :ownerships, :wallets

    remove_column :pictures, :picture_id
    remove_column :pictures, :user_id
    add_column :pictures, :wallet_id, :integer, index: true
    add_foreign_key :pictures, :wallets
  end

  def down
    remove_column :ownerships, :wallet_id

    add_column :ownerships, :user_id, :integer
    add_foreign_key :ownerships, :users

    remove_column :pictures, :wallet_id
    add_column :pictures, :user_id
    add_foreign_key :pictures, :users
  end
end
