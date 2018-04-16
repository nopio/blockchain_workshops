class CreateWallet < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.string :address, null: false
    end
  end
end
