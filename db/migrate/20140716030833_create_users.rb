class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "password"
      t.string "first_name"
      t.string "last_name"
      t.string "email_address"
      t.timestamps
    end
  end
end
