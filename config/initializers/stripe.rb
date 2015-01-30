<<<<<<< HEAD
Rails.configuration.stripe = {
  publishable_key: "pk_live_gPLzTeAUxnJXtim9VBBYDnqX",
  secret_key: "sk_live_Q0uIsgYUXvOecK3S1xjvCpNi"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
=======
Stripe.api_key = ENV["STRIPE_SEC"]
STRIPE_PUBLIC_KEY = ENV["STRIPE_PUB"]

STRIPE_PLAN_NAME = "bob01"

require "json"

StripeEvent.subscribe 'customer.subscription.deleted' do |event|
	e = Stripe::Event.retrieve(event.id)
	customer = Stripe::Customer.retrieve(e.data.object.customer)
	default_card = customer.cards.retrieve(customer.default_card)
	default_card.delete
	member = User.find_by stripe_id: customer.id
	member.subscription.delete
	member.role = "locked"
	member.save  
end
>>>>>>> 03d769cee58abf5dcc69f3c067f44e1fc904511a
