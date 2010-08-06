# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_eventstreams_session',
  :secret      => 'ad5f5ac6635a762f0abb1941f69d1349b5d77e8983096ed95aaa419ee5db73356efbc4126fe77925a9ac76d1aa275d3c0cb8941e525d20469ff9bbece71515cb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
