Rails.configuration.stripe = {
  publishable_key: ENV["stripe_pub"],
  secret_key: ENV["stripe_sec"]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
