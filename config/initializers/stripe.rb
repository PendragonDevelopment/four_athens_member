Rails.configuration.stripe = {
  publishable_key: "pk_test_l6Vulu7Jo8Luk6RUV5kYFsv1",
  secret_key: "sk_test_s9df0QSOqTCCm7tLRQlKls2g"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]