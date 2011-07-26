# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_project_session',
  :secret      => '64b23b4d92444af9c7d4a161d35701f0c64052f3ba7209b98f3270cbcbd8619c151f55cd420e17d7a9583965a5335abdd1e2e4e40686b18ee8aaadaa34a8f49f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
