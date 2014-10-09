class AddTimeToSlots < ActiveRecord::Migration
  def change
  	change_table :slots do |t|
      t.string :time
    end
  end
end
