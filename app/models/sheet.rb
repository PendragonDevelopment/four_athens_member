class Sheet < ActiveRecord::Base

	belongs_to :user
	has_many :slots, dependent: :destroy
end

# ## Schema Information
#
# Table name: `sheets`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`date`**         | `string(255)`      |
# **`description`**  | `text`             |
# **`user_id`**      | `integer`          |
# **`created_at`**   | `datetime`         |
# **`updated_at`**   | `datetime`         |
#
