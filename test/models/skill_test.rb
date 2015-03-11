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

require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
