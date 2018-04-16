class CreateHsm < ActiveRecord::Migration[5.1]
  def change
    create_table :hsm do |t|
      t.string :private_key, null: false
    end
  end
end
