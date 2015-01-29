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