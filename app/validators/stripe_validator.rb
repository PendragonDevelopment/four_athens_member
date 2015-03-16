class StripeValidator < ActiveModel::Validator

  def validate(user)
    stripe_customers = Stripe::Customer.all(limit: 100).to_a
    last_customer = stripe_customers.last
    stripe_customers = stripe_customers + Stripe::Customer.all(limit: 100, starting_after: last_customer.id).to_a.flatten
    last_customer = stripe_customers.last
    stripe_customers = stripe_customers + Stripe::Customer.all(limit: 100, starting_after: last_customer.id).to_a.flatten
    emails = stripe_customers.collect { |customer| customer[:email] }.compact!
    unless emails.include?(user.email)
      user.errors[:email] << "- You are not yet a FourAthens member. Contact jim@fourathens.com to change this."
    end
  end
end