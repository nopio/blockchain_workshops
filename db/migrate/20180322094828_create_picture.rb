class CreatePicture < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :fingerprint
      t.references :picture, :user, foreign_key: true
    end
  end
end
