class AddPositionToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :position, :integer
  end
end
