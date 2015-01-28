Rails.configuration.stripe = {
  publishable_key: "pk_live_gPLzTeAUxnJXtim9VBBYDnqX",
  secret_key: "sk_live_Q0uIsgYUXvOecK3S1xjvCpNi"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]