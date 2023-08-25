class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :customer_name
      t.integer :mobile
      t.string :room_type
      t.integer :member
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
