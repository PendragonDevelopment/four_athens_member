# ## Schema Information
#
# Table name: `profiles`
#
# ### Columns
#
# Name                       | Type               | Attributes
# -------------------------- | ------------------ | ---------------------------
# **`id`**                   | `integer`          | `not null, primary key`
# **`user_id`**              | `integer`          |
# **`position`**             | `string(255)`      |
# **`company`**              | `string(255)`      |
# **`phone`**                | `string(255)`      |
# **`micro_bio`**            | `string(255)`      |
# **`linked_in`**            | `string(255)`      |
# **`twitter`**              | `string(255)`      |
# **`dribble`**              | `string(255)`      |
# **`behance`**              | `string(255)`      |
# **`codepen`**              | `string(255)`      |
# **`github`**               | `string(255)`      |
# **`created_at`**           | `datetime`         |
# **`updated_at`**           | `datetime`         |
# **`avatar_file_name`**     | `string(255)`      |
# **`avatar_content_type`**  | `string(255)`      |
# **`avatar_file_size`**     | `integer`          |
# **`avatar_updated_at`**    | `datetime`         |
#
# ### Indexes
#
# * `index_profiles_on_user_id`:
#     * **`user_id`**
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
