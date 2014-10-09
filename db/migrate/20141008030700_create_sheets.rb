class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.string :date
      t.text :description
      t.integer :user_id, index: true
      t.timestamps
    end


  end
end
