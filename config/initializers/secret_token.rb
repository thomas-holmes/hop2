# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Shorty::Application.config.secret_key_base = ENV['SECRET_TOKEN'] || '8a4c49a75e9381fcb76a7c02e00b14a0a9019e25602a243353a2d0d8349f0e09cbf7486130e09f3222808f2821c3249ef342e0a339d44e7bf95a5a01d24d2714'
