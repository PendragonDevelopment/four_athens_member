class Comment < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :post

  acts_as_mentioner


  default_scope -> { order('created_at ASC') }
end

# ## Schema Information
#
# Table name: `comments`
#
# ### Columns
#
# Name                   | Type               | Attributes
# ---------------------- | ------------------ | ---------------------------
# **`id`**               | `integer`          | `not null, primary key`
# **`user_id`**          | `integer`          |
# **`post_id`**          | `integer`          |
# **`comment_content`**  | `text`             |
# **`created_at`**       | `datetime`         |
# **`updated_at`**       | `datetime`         |
#
# ### Indexes
#
# * `index_comments_on_post_id`:
#     * **`post_id`**
# * `index_comments_on_user_id`:
#     * **`user_id`**
#
