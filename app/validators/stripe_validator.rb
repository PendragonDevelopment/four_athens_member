class StripeValidator < ActiveModel::Validator

  def validate(user)
    stripe_customers = Stripe::Customer.all
    emails = stripe_customers[:data].collect { |customer| customer[:email] }
    unless emails.include?(user.email)
      user.errors[:email] << "- You are not yet a FourAthens member. Contact jim@fourathens.com to change this."
    end
  end
end