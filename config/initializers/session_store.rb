# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_HMIS_session',
  :secret      => '0adedeecdbc4ab31d2507eea56cc3931ea73955307e9a74f6e2d980c680af709d21121df4fdc118a91c1031e4be549484f7505945c55588e550a98b994ab5551'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
