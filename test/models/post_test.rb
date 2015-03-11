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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
