class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.string :room_category
      t.string :status
      t.integer :occupency
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
