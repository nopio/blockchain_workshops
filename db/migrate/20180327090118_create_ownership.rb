class CreateOwnership < ActiveRecord::Migration[5.1]
  def change
    create_table :ownerships, id: false do |t|
      t.references :user
      t.references :picture
    end
  end
end
