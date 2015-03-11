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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
