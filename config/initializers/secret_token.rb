# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
if Rails.env.test? || Rails.env.development?
  Justbought::Application.config.secret_key_base = '4a0ed945e7faef593146d4aaab3f2e553f4acaeab5c98f1152a77dd3b8f0d98926f29f989dbee1d3c949c4f6043a58fde45f47c9a53650d0e5ddcb5f51ed2864'
else
  raise "You must set a secret token in ENV['SECRET_TOKEN'] or in config/initializers/secret_token.rb" if ENV['SECRET_TOKEN'].blank?
  Justbought::Application.config.secret_token = ENV['SECRET_TOKEN']
end

