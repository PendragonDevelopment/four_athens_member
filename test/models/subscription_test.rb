# ## Schema Information
#
# Table name: `subscriptions`
#
# ### Columns
#
# Name                 | Type               | Attributes
# -------------------- | ------------------ | ---------------------------
# **`id`**             | `integer`          | `not null, primary key`
# **`last_4_digits`**  | `string(255)`      |
# **`stripe_id`**      | `string(255)`      |
# **`user_id`**        | `integer`          |
# **`created_at`**     | `datetime`         |
# **`updated_at`**     | `datetime`         |
#
# ### Indexes
#
# * `index_subscriptions_on_user_id`:
#     * **`user_id`**
#

require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
