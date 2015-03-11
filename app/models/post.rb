class Post < ActiveRecord::Base
  
  has_many :comments
  belongs_to :user

  acts_as_mentioner
 
  validates_presence_of :post_content
  validates_presence_of :user_id




  default_scope -> { order('created_at DESC') }
end

# ## Schema Information
#
# Table name: `posts`
#
# ### Columns
#
# Name                | Type               | Attributes
# ------------------- | ------------------ | ---------------------------
# **`id`**            | `integer`          | `not null, primary key`
# **`user_id`**       | `integer`          |
# **`post_content`**  | `text`             |
# **`created_at`**    | `datetime`         |
# **`updated_at`**    | `datetime`         |
# **`hiring`**        | `boolean`          | `default(FALSE)`
# **`promote`**       | `boolean`          | `default(FALSE)`
# **`launch`**        | `boolean`          | `default(FALSE)`
# **`tools`**         | `boolean`          | `default(FALSE)`
# **`request`**       | `boolean`          | `default(FALSE)`
# **`event`**         | `boolean`          | `default(FALSE)`
#
# ### Indexes
#
# * `index_posts_on_user_id`:
#     * **`user_id`**
#
