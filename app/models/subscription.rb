class Subscription < ActiveRecord::Base
  belongs_to :user
  
  before_destroy :cancel_subscription

  def cancel_subscription
  	customer = Stripe::Customer.retrieve(self.user.stripe_id)
	customer.subscriptions.retrieve(self.stripe_id).delete
  end

end
