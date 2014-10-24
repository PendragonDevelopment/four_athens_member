class AddStartTimeEndTimeToSlots < ActiveRecord::Migration
  def change
  	change_table :slots do |t|
      t.string :start_time
      t.string :end_time
    end
    remove_column :slots, :time, :string
  end
end
