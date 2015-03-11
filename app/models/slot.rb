class Slot < ActiveRecord::Base

	belongs_to :user
	belongs_to :sheet

	validates_presence_of :start_time
	validates_presence_of :end_time
	validates_presence_of :sheet_id

end

# ## Schema Information
#
# Table name: `slots`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`user_id`**     | `integer`          |
# **`sheet_id`**    | `integer`          |
# **`created_at`**  | `datetime`         |
# **`updated_at`**  | `datetime`         |
# **`start_time`**  | `string(255)`      |
# **`end_time`**    | `string(255)`      |
#
