class Skill < ActiveRecord::Base

  has_and_belongs_to_many :users

  validates_uniqueness_of :skill_name
  
end

# ## Schema Information
#
# Table name: `skills`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`skill_name`**  | `string(255)`      |
# **`created_at`**  | `datetime`         |
# **`updated_at`**  | `datetime`         |
# **`position`**    | `integer`          |
#
