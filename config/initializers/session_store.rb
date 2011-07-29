# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Global_Login_session',
  :secret      => '935a0ce1e1b2c123311649ae6b5e1d4e636717b0c2ca20b258bcfb7d935b7367cf98d0a9837c90b1d96070e789f384144b263cc5285590543a6290dba3926e4e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
