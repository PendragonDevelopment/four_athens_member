class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.timestamps
    end
    create_table :skills_users, :id => false do |t|
      t.belongs_to :skill
      t.belongs_to :user
    end  
   add_index :skills_users,  ["skill_id", "user_id" ]
    remove_column "users", "email_address", :string
    remove_column "users", "password_digest", :string
  end
end
