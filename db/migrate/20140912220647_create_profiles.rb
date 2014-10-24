class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :position
      t.string :company
      t.string :phone
      t.string :micro_bio
      t.string :linked_in
      t.string :twitter
      t.string :dribble
      t.string :behance
      t.string :codepen
      t.string :github
      t.timestamps
    end
    add_index(:profiles, :user_id)
  end
end
