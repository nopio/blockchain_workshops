class RemoveHsm < ActiveRecord::Migration[5.1]
  def self.up
    drop_table :hsm
    remove_column :wallets, :private_key_id
    add_column :wallets, :private_key, :string
  end

  def self.down
    create_table :hsm do |t|
      t.string :private_key, null: false
    end

    add_column :wallets, :private_key_id, :integer, foreign_key: true, index: true
    remove_column :wallets, :private_key
  end
end
