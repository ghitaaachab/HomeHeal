class CreateHcpAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :hcp_availabilities do |t|
      t.references :hcp, null: false, foreign_key: true
      t.date :date
      t.boolean :available

      t.timestamps
    end
  end
end
