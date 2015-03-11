class Subscription < ActiveRecord::Base
  belongs_to :user
  
  before_destroy :cancel_subscription

  def cancel_subscription
  	customer = Stripe::Customer.retrieve(self.user.stripe_id)
	customer.subscriptions.retrieve(self.stripe_id).delete
  end

end

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
