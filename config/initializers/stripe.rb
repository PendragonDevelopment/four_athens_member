Stripe.api_key = "sk_test_s9df0QSOqTCCm7tLRQlKls2g"
STRIPE_PUBLIC_KEY = "pk_test_l6Vulu7Jo8Luk6RUV5kYFsv1"

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
