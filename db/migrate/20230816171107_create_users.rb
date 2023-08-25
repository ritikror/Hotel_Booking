class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :password_digest
      t.integer :mobile
      t.string :type, null: false

      t.timestamps
    end
  end
end
