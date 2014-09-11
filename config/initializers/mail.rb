ActionMailer::Base.smtp_settings = {
  address: "smtp.mandrillapp.com",
  port: 587,
  enable_starttls_auto: true,
  user_name: "ddresselhaus@gmail.com",
  password: "T5iSoVRE1KF7YRxQHTH7Tw",
  authentication: "login"

}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"