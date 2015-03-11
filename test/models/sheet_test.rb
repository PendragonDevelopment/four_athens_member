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

require 'test_helper'

class SheetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
