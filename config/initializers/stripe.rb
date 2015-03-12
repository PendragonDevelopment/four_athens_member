Rails.configuration.stripe = {
  publishable_key: "stripe_pub",
  secret_key: "stripe_sec"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]