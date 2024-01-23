class CreateHcps < ActiveRecord::Migration[7.1]
  def change
    create_table :hcps do |t|
      t.references :user, null: false, foreign_key: true
      t.string :speciality
      t.integer :experience
      t.integer :age
      t.boolean :availability
      t.integer :price
      t.string :background_image
      t.timestamps
    end
  end
end
