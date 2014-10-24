class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :user_id
      t.integer :sheet_id

      t.timestamps
    end
  end
end
