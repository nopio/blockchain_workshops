class CreateContract < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.string :address, null: false

      t.timestamps null: false
    end
  end
end
