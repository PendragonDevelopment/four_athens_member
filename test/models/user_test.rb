# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`id`**                      | `integer`          | `not null, primary key`
# **`first_name`**              | `string(255)`      |
# **`last_name`**               | `string(255)`      |
# **`created_at`**              | `datetime`         |
# **`updated_at`**              | `datetime`         |
# **`admin`**                   | `boolean`          | `default(FALSE)`
# **`email`**                   | `string(255)`      | `default(""), not null`
# **`encrypted_password`**      | `string(255)`      | `default(""), not null`
# **`reset_password_token`**    | `string(255)`      |
# **`reset_password_sent_at`**  | `datetime`         |
# **`remember_created_at`**     | `datetime`         |
# **`sign_in_count`**           | `integer`          | `default(0), not null`
# **`current_sign_in_at`**      | `datetime`         |
# **`last_sign_in_at`**         | `datetime`         |
# **`current_sign_in_ip`**      | `string(255)`      |
# **`last_sign_in_ip`**         | `string(255)`      |
# **`role`**                    | `string(255)`      | `default("member")`
# **`stripe_id`**               | `string(255)`      |
#
# ### Indexes
#
# * `index_users_on_reset_password_token` (_unique_):
#     * **`reset_password_token`**
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
