# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kazaa-similar-artists_session',
  :secret      => '1a8adc03ebf3a9547d02f43111008657361a2f89c46886093276e59075bd1ca1a1690e98c5a92dc26f3a39ca35e4c19fbca4a050f01800caf033b87a607ec814'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
