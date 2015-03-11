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

require 'test_helper'

class SlotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
