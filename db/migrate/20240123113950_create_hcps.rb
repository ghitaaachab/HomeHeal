class CreateHcps < ActiveRecord::Migration[7.1]
  def change
    create_table :hcps do |t|
      t.references :user, null: false, foreign_key: true
      t.string :speciality
      t.integer :experience
      t.integer :age
      t.integer :price
      t.string :biography
      t.timestamps
    end
  end
end
