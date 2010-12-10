# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_WatirCukeFM_session',
  :secret      => '11ae7f36eb486ac9e09b53a97c9c27397fc4b1494278c5a0d69eeb813ad9f62b545da6ad60358e74820fb19ac3ce0f18aa39ec5ab4a1415ebfecbd0ec2f938e1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
